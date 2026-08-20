#! /usr/bin/env zsh

[ ! -d "./output/iosevka" ] && mkdir -p ./output/iosevka && tar -xf ./iosevka.tar.xz -C ./output/iosevka
if [ ! -d "./ouptut/font-patcher" ]; then
  curl "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip" -L --output "output/font-patcher.zip"
  unzip -o output/font-patcher.zip -d output/font-patcher
fi

fontforge -script font-patcher ./output/iosevka/IosevkaCustomMediumSemiNerdFont-Extended.ttf
