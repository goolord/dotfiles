#!/usr/bin/env python3
"""
Unify multi-weight Iosevka Nerd Fonts into a single OpenType font family.

This script repairs the Name, OS/2, and head tables in TTF fonts generated
by nerd-font-patcher where weights were mistakenly split into separate families
(e.g., IosevkaCustomSemi Nerd Font Extended vs IosevkaCustomBoldSemi Nerd Font Extended).
"""

import os
import sys
import glob
import shutil
from fontTools.ttLib import TTFont

FAMILY_NAME = "Iosevka Custom SemiExtended Nerd Font"
PS_FAMILY_PREFIX = "IosevkaCustomSemiExtNF"

WEIGHT_MAP = [
    ("Thin", "Thin", 100),
    ("Extralight", "ExtraLight", 200),
    ("Light", "Light", 300),
    ("Medium", "Medium", 500),
    ("Semibold", "SemiBold", 600),
    ("Extrabold", "ExtraBold", 800),
    ("Heavy", "Heavy", 900),
    ("Bold", "Bold", 700),
    ("Semi", "Regular", 400),
]

def parse_font_style(filename):
    basename = os.path.basename(filename)
    
    # 1. Slope
    if "Italic" in basename:
        slope = "Italic"
    elif "Oblique" in basename:
        slope = "Oblique"
    else:
        slope = "Upright"
        
    # 2. Weight
    weight_name = "Regular"
    weight_class = 400
    for prefix, w_name, w_class in WEIGHT_MAP:
        if prefix == "Semi":
            continue
        if f"IosevkaCustom{prefix}Semi" in basename or f"IosevkaCustom{prefix}" in basename:
            weight_name = w_name
            weight_class = w_class
            break
    else:
        if "IosevkaCustomSemi" in basename:
            weight_name = "Regular"
            weight_class = 400
            
    # 3. Typographic Subfamily
    if slope == "Upright":
        typo_subfamily = weight_name
    elif weight_name == "Regular":
        typo_subfamily = slope
    else:
        typo_subfamily = f"{weight_name} {slope}"
        
    # 4. RIBBI Family / Subfamily (for legacy 4-style mapping)
    if typo_subfamily in ["Regular", "Bold", "Italic", "Bold Italic"]:
        ribbi_family = FAMILY_NAME
        ribbi_subfamily = typo_subfamily
    elif typo_subfamily == "Bold Oblique":
        ribbi_family = FAMILY_NAME
        ribbi_subfamily = "Bold Italic"
    elif typo_subfamily == "Oblique":
        ribbi_family = FAMILY_NAME
        ribbi_subfamily = "Italic"
    else:
        # Non-RIBBI: e.g. "Iosevka Custom SemiExtended Nerd Font Light"
        if slope == "Upright":
            ribbi_family = f"{FAMILY_NAME} {weight_name}"
            ribbi_subfamily = "Regular"
        else:
            ribbi_family = f"{FAMILY_NAME} {weight_name}"
            ribbi_subfamily = "Italic"
            
    # 5. PostScript Name (no spaces, max 63 ASCII chars)
    ps_style = typo_subfamily.replace(" ", "")
    ps_name = f"{PS_FAMILY_PREFIX}-{ps_style}"
    
    # 6. Full Name
    full_name = f"{FAMILY_NAME} {typo_subfamily}" if typo_subfamily != "Regular" else FAMILY_NAME
    
    # 7. Clean output filename
    clean_filename = f"{FAMILY_NAME.replace(' ', '')}-{ps_style}.ttf"
    
    return {
        "weight_name": weight_name,
        "weight_class": weight_class,
        "slope": slope,
        "typo_family": FAMILY_NAME,
        "typo_subfamily": typo_subfamily,
        "ribbi_family": ribbi_family,
        "ribbi_subfamily": ribbi_subfamily,
        "full_name": full_name,
        "ps_name": ps_name,
        "clean_filename": clean_filename,
    }

def fix_font_file(src_path, dst_path, info):
    font = TTFont(src_path)
    name_table = font["name"]
    
    # Name IDs to replace
    target_ids = {1, 2, 3, 4, 6, 16, 17, 21, 22}
    name_table.names = [n for n in name_table.names if n.nameID not in target_ids]
    
    # Standard platforms: Macintosh (1,0,0) and Windows (3,1,1033)
    platforms = [
        (1, 0, 0),
        (3, 1, 1033),
    ]
    
    # Retrieve version string
    version_str = "Version 33.2.0;Nerd Fonts 3.3.0"
    for rec in font["name"].names:
        if rec.nameID == 5:
            version_str = rec.toUnicode()
            break
            
    unique_id = f"{version_str};{info['ps_name']};{info['full_name']}"
    
    for pid, eid, lid in platforms:
        name_table.setName(info["ribbi_family"], 1, pid, eid, lid)
        name_table.setName(info["ribbi_subfamily"], 2, pid, eid, lid)
        name_table.setName(unique_id, 3, pid, eid, lid)
        name_table.setName(info["full_name"], 4, pid, eid, lid)
        name_table.setName(info["ps_name"], 6, pid, eid, lid)
        name_table.setName(info["typo_family"], 16, pid, eid, lid)
        name_table.setName(info["typo_subfamily"], 17, pid, eid, lid)
        name_table.setName(info["typo_family"], 21, pid, eid, lid)
        name_table.setName(info["typo_subfamily"], 22, pid, eid, lid)
        
    # OS/2 table updates
    os2 = font["OS/2"]
    os2.usWeightClass = info["weight_class"]
    os2.usWidthClass = 6 # Semi-expanded
    
    is_bold = info["weight_class"] >= 700
    is_italic = info["slope"] in ["Italic", "Oblique"]
    is_regular = (info["weight_class"] == 400) and (not is_italic)
    
    fs_selection = 0
    if is_italic:
        fs_selection |= (1 << 0) # ITALIC
    if is_bold:
        fs_selection |= (1 << 5) # BOLD
    if is_regular:
        fs_selection |= (1 << 6) # REGULAR
    fs_selection |= (1 << 7)     # USE_TYPO_METRICS
    fs_selection |= (1 << 8)     # WWS
    os2.fsSelection = fs_selection
    
    # head table updates
    head = font["head"]
    mac_style = 0
    if is_bold:
        mac_style |= (1 << 0)
    if is_italic:
        mac_style |= (1 << 1)
    head.macStyle = mac_style
    
    font.save(dst_path)
    return info

def main():
    source_dir = sys.argv[1] if len(sys.argv) > 1 else "/Users/zach/Library/Fonts"
    target_dir = sys.argv[2] if len(sys.argv) > 2 else "/Users/zach/Library/Fonts"
    
    font_files = sorted(glob.glob(os.path.join(source_dir, "IosevkaCustom*SemiNerdFont-Extended*.ttf")))
    if not font_files:
        print(f"No matching fonts found in {source_dir}")
        sys.exit(1)
        
    print(f"Found {len(font_files)} fonts to unify under '{FAMILY_NAME}'...")
    
    backup_dir = os.path.join(source_dir, "backup_before_unify")
    os.makedirs(backup_dir, exist_ok=True)
    os.makedirs(target_dir, exist_ok=True)
    
    for src in font_files:
        # Backup original
        backup_path = os.path.join(backup_dir, os.path.basename(src))
        if not os.path.exists(backup_path):
            shutil.copy2(src, backup_path)
            
        info = parse_font_style(src)
        dst = os.path.join(target_dir, os.path.basename(src))
        fix_font_file(src, dst, info)
        print(f"  ✓ {info['typo_subfamily']:20} -> {os.path.basename(dst)}")

    print("\nDone! All fonts have been unified into a single family.")
    print(f"Family name: '{FAMILY_NAME}'")

if __name__ == "__main__":
    main()
