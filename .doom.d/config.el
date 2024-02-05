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
(setq doom-theme 'doom-xcode)

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18))
;; (setq doom-font (font-spec :family "Comic Code Ligatures Bold" :size 18))
(setq doom-unicode-font (font-spec :family "DejaVu Sans" :size 18))

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

(define-key c++-mode-map (kbd "<normal-state> C-l") 'windmove-right)
(define-key c++-mode-map (kbd "<normal-state> C-h") 'windmove-left)
(define-key c++-mode-map (kbd "<normal-state> C-k") 'windmove-up)
(define-key c++-mode-map (kbd "<normal-state> C-j") 'windmove-down)

(define-key c-mode-map (kbd "<normal-state> C-l") 'windmove-right)
(define-key c-mode-map (kbd "<normal-state> C-h") 'windmove-left)
(define-key c-mode-map (kbd "<normal-state> C-k") 'windmove-up)
(define-key c-mode-map (kbd "<normal-state> C-j") 'windmove-down)

(define-key cpp-mode-map (kbd "<normal-state> C-l") 'windmove-right)
(define-key cpp-mode-map (kbd "<normal-state> C-h") 'windmove-left)
(define-key cpp-mode-map (kbd "<normal-state> C-k") 'windmove-up)
(define-key cpp-mode-map (kbd "<normal-state> C-j") 'windmove-down)

;; Neotree
(define-key evil-normal-state-map (kbd ",nt") 'neotree-toggle)

;; No highlight
(define-key evil-normal-state-map (kbd ",hl") 'evil-ex-nohighlight)

;; Default theme

;; (setq doom-theme 'doom-xcode)

(set-eshell-alias! "lmk" "latexmk -pvc -pdf -halt-on-error")

(use-package! citar :custom (citar-bibliography '("~/work/uni.bib")))
(use-package! citar :custom (citar-notes-paths '("~/work/LitNotes/literature/")))

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)


;; Bind `SPC' to `yas-expand' when snippet expansion available (it
;; will still call `self-insert-command' otherwise).
(define-key yas-minor-mode-map (kbd "C-'") yas-maybe-expand)
;; Bind `C-c y' to `yas-expand' ONLY.
(define-key yas-minor-mode-map (kbd "C-c y") #'yas-expand)


(add-hook 'doc-view-mode-hook 'auto-revert-mode)

(define-key evil-normal-state-map (kbd ", t") 'sp-transpose-sexp)

(define-key evil-normal-state-map (kbd "SPC m @") 'citar-insert-citation)

(yas--remove-template-by-uuid (yas--table-get-create 'python-mode) "logging")
(yas--remove-template-by-uuid (yas--table-get-create 'latex-mode) "time")

;;Python Black
(use-package! python-black
  :demand t
  :after python)
(add-hook! 'python-mode-hook #'python-black-on-save-mode)

(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

(add-hook 'LaTeX-mode-hook (lambda ()
                             (TeX-fold-mode 1)))

(add-hook 'LaTeX-mode-hook #'+word-wrap-mode)

(add-hook 'LaTeX-mode-hook #'evil-tex-mode)

(add-hook 'text-mode-hook #'auto-fill-mode)
(setq-default fill-column 80)

(setq-default TeX-master 'shared)

                                        ; In Org-mode, hit f5 to run latex-export
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "<f5>") (kbd "SPC m e l p"))))

(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "<f6>") (kbd "SPC m e l S-p"))))
                                        ; In Org-mode hit ,l to preview latex blocks
(evil-define-key 'normal org-mode-map (kbd ",l") 'org-latex-preview)


                                        ; In Latex hit f5 to compile with highlighting
(evil-define-key 'normal LaTeX-mode-map (kbd "<f5>") (kbd "SPC m c"))
                                        ; In Latex hit f6 to view the compiled PDF
(evil-define-key 'normal LaTeX-mode-map (kbd "<f6>") (kbd "SPC m v"))

                                        ; In Latex hit SPC m i to insert environment
(evil-define-key 'normal LaTeX-mode-map (kbd "SPC m i") #'cdlatex-environment)
(evil-define-key 'visual LaTeX-mode-map (kbd "SPC m i") #'cdlatex-environment)

(evil-define-key 'visual LaTeX-mode-map (kbd "SPC m b") #'TeX-font)





                                        ; Make window fullscreen on startup
;; (add-to-list 'default-frame-alist '(fullscreen . fullboth))


                                        ;Scrolling when you reach n lines from bottom
(setq scroll-margin 8)

                                        ;Keep it centered
(defun my-center-line (&rest _)
  (evil-scroll-line-to-center nil))
(advice-add 'evil-search-next :after #'my-center-line)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2))

(add-hook 'web-mode-hook  'my-web-mode-hook)

;; __________________________________________________
;; __________________________________________________
;; LATEX Synctex can be achieved using either this

(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
;; __________________________________________________
;; __________________________________________________

;; Or THIS

;; __________________________________________________
;; __________________________________________________
;; ; SyncTeX basics

;; ; un-urlify and urlify-escape-only should be improved to handle all special characters, not only spaces.
;; ; The fix for spaces is based on the first comment on http://emacswiki.org/emacs/AUCTeX#toc20

;; (defun un-urlify (fname-or-url)
;;   "Transform file:///absolute/path from Gnome into /absolute/path with very limited support for special characters"
;;   (if (string= (substring fname-or-url 0 8) "file:///")
;;       (url-unhex-string (substring fname-or-url 7))
;;     fname-or-url))

;; (defun urlify-escape-only (path)
;;   "Handle special characters for urlify"
;;   (replace-regexp-in-string " " "%20" path))

;; (defun urlify (absolute-path)
;;   "Transform /absolute/path to file:///absolute/path for Gnome with very limited support for special characters"
;;   (if (string= (substring absolute-path 0 1) "/")
;;       (concat "file://" (urlify-escape-only absolute-path))
;;       absolute-path))


;; ; SyncTeX backward search - based on http://emacswiki.org/emacs/AUCTeX#toc20, reproduced on https://tex.stackexchange.com/a/49840/21017

;; (defun th-evince-sync (file linecol &rest ignored)
;;   (let* ((fname (un-urlify file))
;;          (buf (find-file fname))
;;          (line (car linecol))
;;          (col (cadr linecol)))
;;     (if (null buf)
;;         (message "[Synctex]: Could not open %s" fname)
;;       (switch-to-buffer buf)
;;       (goto-line (car linecol))
;;       (unless (= col -1)
;;         (move-to-column col)))))

;; (defvar *dbus-evince-signal* nil)

;; (defun enable-evince-sync ()
;;   (require 'dbus)
;;   ; cl is required for setf, taken from: http://lists.gnu.org/archive/html/emacs-orgmode/2009-11/msg01049.html
;;   (require 'cl)
;;   (when (and
;;          (eq window-system 'x)
;;          (fboundp 'dbus-register-signal))
;;     (unless *dbus-evince-signal*
;;       (setf *dbus-evince-signal*
;;             (dbus-register-signal
;;              :session nil "/org/gnome/evince/Window/0"
;;              "org.gnome.evince.Window" "SyncSource"
;;              'th-evince-sync)))))

;; (add-hook 'LaTeX-mode-hook 'enable-evince-sync)


;; ; SyncTeX forward search - based on https://tex.stackexchange.com/a/46157

;; ;; universal time, need by evince
;; (defun utime ()
;;   (let ((high (nth 0 (current-time)))
;;         (low (nth 1 (current-time))))
;;    (+ (* high (lsh 1 16) ) low)))

;; ;; Forward search.
;; ;; Adapted from http://dud.inf.tu-dresden.de/~ben/evince_synctex.tar.gz
;; (defun auctex-evince-forward-sync (pdffile texfile line)
;;   (let ((dbus-name
;;          (dbus-call-method :session
;;                    "org.gnome.evince.Daemon"  ; service
;;                    "/org/gnome/evince/Daemon" ; path
;;                    "org.gnome.evince.Daemon"  ; interface
;;                    "FindDocument"
;;                    (urlify pdffile)
;;                    t)))     ; Open a new window if the file is not opened.

;;     (dbus-call-method :session
;;           dbus-name
;;           "/org/gnome/evince/Window/0"
;;           "org.gnome.evince.Window"
;;           "SyncView"
;;           (urlify-escape-only texfile)
;;           (list :struct :int32 line :int32 1)
;;      (utime))))

;; (defun auctex-evince-view ()
;;   (let ((pdf (file-truename (concat default-directory
;;                              (TeX-master-file (TeX-output-extension)))))
;;         (tex (buffer-file-name))
;;         (line (line-number-at-pos)))
;;     (auctex-evince-forward-sync pdf tex line)))

;; ;; New view entry: Evince via D-bus.
;; (setq TeX-view-program-list '())
;; (add-to-list 'TeX-view-program-list
;;          '("EvinceDbus" auctex-evince-view))

;; ;; Prepend Evince via D-bus to program selection list
;; ;; overriding other settings for PDF viewing.
;; (setq TeX-view-program-selection '())
;; (add-to-list 'TeX-view-program-selection
;;          '(output-pdf "EvinceDbus"))
;; __________________________________________________
;; __________________________________________________
;; __________________________________________________
;; __________________________________________________
;; __________________________________________________
;; __________________________________________________
;; __________________________________________________

;; HARPOON settings
;; You can use this hydra menu that have all the commands
(map! :n "C-SPC" 'harpoon-quick-menu-hydra)
(map! :n "C-s" 'harpoon-add-file)

;; And the vanilla commands
(map! :leader "j c" 'harpoon-clear)
(map! :leader "j f" 'harpoon-toggle-file)
(map! :leader "1" 'harpoon-go-to-1)
(map! :leader "2" 'harpoon-go-to-2)
(map! :leader "3" 'harpoon-go-to-3)
(map! :leader "4" 'harpoon-go-to-4)
(map! :leader "5" 'harpoon-go-to-5)
(map! :leader "6" 'harpoon-go-to-6)
(map! :leader "7" 'harpoon-go-to-7)
(map! :leader "8" 'harpoon-go-to-8)
(map! :leader "9" 'harpoon-go-to-9)

;; Reftex table of contents on the left
(setq reftex-toc-split-windows-horizontally t)
(setq reftex-toc-split-windows-fraction 0.3)

(add-hook 'lsp-after-open-hook (lambda ()
                                 (when (lsp-find-workspace 'rust-analyzer nil)
                                   (lsp-inlay-hints-mode))))


(setq org-link-file-path-type 'relative)


(use-package laas
  :hook (LaTeX-mode . laas-mode)
  :config ; do whatever here
  (aas-set-snippets 'laas-mode
                    "mk" (lambda () (interactive)
                           (yas-expand-snippet "$$1$"))
                    ;; set condition!
                    :cond #'texmathp ; expand only while in math
                    "supp" "\\supp"
                    "On" "O(n)"
                    "O1" "O(1)"
                    "Olog" "O(\\log n)"
                    "Olon" "O(n \\log n)"
                    ;; bind to functions!
                    "Sum" (lambda () (interactive)
                            (yas-expand-snippet "\\sum_{$1}^{$2} $0"))
                    "Span" (lambda () (interactive)
                             (yas-expand-snippet "\\Span($1)$0"))
                    "fx" (lambda () (interactive)
                           (yas-expand-snippet "f(x)"))
                    "gx" (lambda () (interactive)
                           (yas-expand-snippet "g(x)"))
                    "Rn" (lambda () (interactive)
                           (yas-expand-snippet "\\Re^{n}"))
                    "Rm" (lambda () (interactive)
                           (yas-expand-snippet "\\Re^{m}"))
                    "Rp" (lambda () (interactive)
                           (yas-expand-snippet "\\Re^{${1:p}}"))
                    ;; add accent snippets
                    :cond #'laas-object-on-left-condition
                    "qq" (lambda () (interactive) (laas-wrap-previous-object "sqrt"))
                    "tilde" (lambda () (interactive) (laas-wrap-previous-object "tilde"))
                    "dot" (lambda () (interactive) (laas-wrap-previous-object "dot"))))

(use-package lsp-julia
  :config
  (setq lsp-julia-default-environment "~/.julia/environments/v1.10"))
