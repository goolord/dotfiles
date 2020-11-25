;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Zachary Churchill"
      user-mail-address "zacharyachurchill@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 20 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 19.25 :weight 'light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; Set cursor color
(setq evil-normal-state-cursor '(box "#ebdbb2")
      evil-insert-state-cursor '(bar "#ebdbb2")
      evil-visual-state-cursor '(hollow "#ebdbb2"))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(global-visual-line-mode t)

(map! :leader
      :desc "Toggle tree"
      "d" #'treemacs)

(map! :leader
      :desc "Toggle vterm"
      "v" #'+vterm/toggle)

(map! :n
      :desc "Tab between windows"
      "<tab>" #'evil-window-next)

(map! :i
      :desc "ctrl shift v paste in instert mode"
      "C-S-V" #'evil-paste-after)

(map! :leader
      :desc "Align"
      "a" #'align)

(map! :desc "Navigate open buffers"
      "M-f" #'ibuffer)

(map! :leader
      :desc "Comment or uncomment"
      "c SPC" #'evilnc-comment-or-uncomment-lines)

(map! :leader
      :desc "ripgrep"
      "r g" #'counsel-rg)

(setq treemacs-TAB-actions-config
  '((root-node-open   . evil-window-next)
    (root-node-closed . evil-window-next)
    (dir-node-open    . evil-window-next)
    (dir-node-closed  . evil-window-next)
    (file-node-open   . evil-window-next)
    (file-node-closed . evil-window-next)
    (tag-node-open    . evil-window-next)
    (tag-node-closed  . evil-window-next)
    (tag-node         . evil-window-next)))

(after! (:and treemacs treemacs-evil)
  (evil-define-key* 'treemacs treemacs-mode-map
    (kbd "h") #'treemacs-collapse-parent-node
    (kbd "l") #'treemacs-RET-action
    (kbd "M-h") #'treemacs-root-up
    (kbd "M-l") #'treemacs-root-down
    (kbd "'") #'treemacs-peek))

(map! :n
      :desc "remove highlight, usually from regex"
      "<esc>" #'evil-ex-nohighlight)

(after! vterm
  (set-popup-rule! "*doom:vterm-popup:main" :size 0.3 :vslot -4 :select t :quit nil :ttl 0 :side 'right))

