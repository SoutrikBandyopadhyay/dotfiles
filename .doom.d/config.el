;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Soutrik Bandyopadhyay"
      user-mail-address "soutrik.band@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18))
 

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")



;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(evil-define-key 'normal 'global (kbd ";") 'evil-ex)

(require 'key-chord)
(key-chord-mode t)
(key-chord-define-global ",," 'evil-normal-state)

;; (global-set-key (kbd "C-c") 'undefined)
;; (global-set-key (kbd "C-c") 'kill-ring-save)
;; (global-set-key (kbd "C-v") 'yank)
;;
;;
(cua-mode +1)

(define-key evil-insert-state-map (kbd "C-c") (lambda () (interactive) (cua-copy-region nil)))
(define-key evil-visual-state-map (kbd "C-c") (lambda () (interactive) (cua-copy-region nil)))
(define-key evil-insert-state-map (kbd "C-v") (lambda () (interactive) (cua-paste nil)))
(define-key evil-insert-state-map (kbd "C-x") (lambda () (interactive) (cua-cut-region nil)))
(define-key evil-visual-state-map (kbd "C-x") (lambda () (interactive) (cua-cut-region nil)))
(define-key evil-insert-state-map (kbd "C-z") 'evil-undo)
(define-key evil-insert-state-map (kbd "C-y") 'evil-redo)
(setq cua-keep-region-after-copy t)

;; Direction keys
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)

;; Neotree
(define-key evil-normal-state-map (kbd ",nt") 'neotree-toggle)

;; No highlight
(define-key evil-normal-state-map (kbd ",hl") 'evil-ex-nohighlight)


(set-eshell-alias! "lmk" "latexmk -pvc -pdf -halt-on-error")

(use-package citar :custom (citar-bibliography '("~/work/uni.bib")))

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)


;; Bind `SPC' to `yas-expand' when snippet expansion available (it
;; will still call `self-insert-command' otherwise).
(define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand)
;; Bind `C-c y' to `yas-expand' ONLY.
(define-key yas-minor-mode-map (kbd "C-c y") #'yas-expand)


(add-hook 'doc-view-mode-hook 'auto-revert-mode)

(define-key evil-normal-state-map (kbd ",nb") 'citar-insert-keys)

(yas--remove-template-by-uuid (yas--table-get-create 'python-mode) "logging")

;;Python Black
(use-package! python-black
  :demand t
  :after python)
(add-hook! 'python-mode-hook #'python-black-on-save-mode)

(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)
