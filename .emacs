;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" default)))
 '(ecb-fix-window-size (quote width))
 '(ecb-layout-name "left16")
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(eclim-eclipse-dirs "/opt/eclipse")
 '(eclim-executable "/opt/eclipse/eclim")
 '(eclimd-executable "/opt/eclipse/eclimd")
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (json-mode docker docker-tramp magit dash org-bullets zenburn-theme jdee eldoro helm-swoop xcscope p4 undo-tree highlight-symbol helm elpy)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

; my-packages.el
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
     ("http" . "168.219.61.252:8080")
     ("https" . "168.219.61.252:8080")))
(setenv "PATH" (concat (getenv "PATH")
			 ";~/.emacs.d/bin/"))
(setq default-input-method "korean-hangul")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq inhibit-startup-message t)
(setq compilation-scroll-output 'first-error)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p) 
(transient-mark-mode t)
(show-paren-mode t)
(delete-selection-mode nil)
(setq iswitchb-mode t)
(setq which-function-mode t)
(if (functionp 'global-hi-lock-mode)
    (global-hi-lock-mode 1)
  (hi-lock-mode 1))
(desktop-save-mode 1)
(setq-default indent-tabs-mode nil)
(setq backup-directory-alist `(("." . "~/backup")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans" :foundry "unknown" :slant normal :weight normal :height 90 :width normal)))))
(load-theme 'zenburn t)
;; (set-face-font 'default "D2Coding-10")
(set-face-font 'default "Ubuntu mono-10")
(set-fontset-font "fontset-default" '(#x1100 . #xffdc)
                   "D2Coding-10")
;; (set-face-attribute 'default nil :height 90)
;; (toggle-frame-maximized)
(setq-default indent-tabs-mode nil)	; always replace tabs with spaces
(setq-default tab-width 4)		; set tab width to 4 for all buffers
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "/usr/bin/chromium-browser")


(require 'server)
(server-start)

(require 'undo-tree)
(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)

(require 'highlight-symbol)
(global-company-mode t)

;; ecb
(add-to-list 'load-path "~/.emacs.d/ecb")
(require 'ecb)
(require 'xcscope)
(require 'eclim)
(require 'eclimd)
(require 'company)
(require 'company-emacs-eclim)

(load-file "~/.emacs.d/helm.el")
(load-file "~/.emacs.d/util.el")
(load-file "~/.emacs.d/cscope.el")
(load-file "~/.emacs.d/p4.el")
(load-file "~/.emacs.d/keybinding.el")
(load-file "~/.emacs.d/ecb.el")

(load-file "~/.emacs.d/languages/org.el")
(load-file "~/.emacs.d/languages/python.el")
(load-file "~/.emacs.d/languages/java.el")
(load-file "~/.emacs.d/languages/xml.el")

(require 'dwim-compile)

(setq auto-mode-alist
 (mapcar 'purecopy
  '(("\\.tex$" . LaTeX-mode)
    ("\\.txi$" . Texinfo-mode)
    ("\\.emacs$" . emacs-lisp-mode)
    ("\\.el$" . emacs-lisp-mode)
    ("\\.org$" . org-mode)
    ("\\.py$" . elpy-mode)
    ("\\.sh$" . sh-mode)
    ("\\.xml$" . nxml-mode)
    ("\\.java$" . java-mode)
    ("\\.js$" . javascript-mode))))

;; (load-file "~/projects/cedet/cedet-devel-load.el")
;; (add-hook 'after-init-hook (lambda ()
;;                              (message "activate-malabar-mode")
;;                              (activate-malabar-mode)))

(put 'erase-buffer 'disabled nil)
(require 'docker-tramp)
