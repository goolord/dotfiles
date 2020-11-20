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

(map! :leader
      :desc "Toggle tree"
      "d" #'treemacs)

(map! :desc "Previous window"
      "<tab>" #'evil-window-prev)

(map! :leader
      :desc "Align"
      "a" #'align)

(map! :desc "Navigate open buffers"
      "M-f" #'ibuffer)

(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)

(setq treemacs-TAB-actions-config
  '((root-node-open   . evil-window-prev)
    (root-node-closed . evil-window-prev)
    (dir-node-open    . evil-window-prev)
    (dir-node-closed  . evil-window-prev)
    (file-node-open   . evil-window-prev)
    (file-node-closed . evil-window-prev)
    (tag-node-open    . evil-window-prev)
    (tag-node-closed  . evil-window-prev)
    (tag-node         . evil-window-prev)))

(with-eval-after-load "treemacs-evil"
  (evil-define-key 'treemacs treemacs-mode-map (kbd "'") #'treemacs-peek)
  (evil-define-key 'treemacs treemacs-mode-map (kbd "h") #'treemacs-collapse-parent-node)
  (evil-define-key 'treemacs treemacs-mode-map (kbd "l") #'treemacs-RET-action)
  (evil-define-key 'treemacs treemacs-mode-map (kbd "M-h") #'treemacs-root-up)
  (evil-define-key 'treemacs treemacs-mode-map (kbd "M-l") #'treemacs-root-down))

(evil-define-key 'normal 'global (kbd "<esc>") #'evil-ex-nohighlight)
