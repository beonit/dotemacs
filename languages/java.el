(defun my-jdee-mode-hook()
  ;; (light-symbol-mode)
  ;; (highlight-current-line)
  (linum-mode)
  ;; (hs-minor-mode)
  ;; (c-toggle-auto-hungry-state t)
  ;; (google-set-c-style)
  ;; (highlight-current-line-minor-mode)
  ;; key binding
  ;; (define-key java-mode-map (kbd "RET") 'newline-and-indent)
  ;; (define-key java-mode-map [(control meta \;)] 'comment-with-stamp)
  ;; (add-to-list 'which-func-modes 'java-mode)
  (cscope-minor-mode)
  (message "beonit jdee-mode done")
  )

(add-hook 'jdee-mode-hook (function cscope:hook))
(add-hook 'jdee-mode-hook 'my-jdee-mode-hook)
(add-hook 'java-mode-hook 'semantic-mode)

(defun my-eclim-java-mode-hook()
  (start-eclimd "~/workspace")
  (linum-mode)
  (cscope-minor-mode)
  (eclim-mode)
  (company-emacs-eclim-setup)
  (define-key java-mode-map [(control meta m)] 'pop-tag-mark)
  (define-key java-mode-map [(control return)] 'company-complete-common)
  (define-key java-mode-map [(control c)(control e)(d)] 'eclim-java-find-declaration)
  (define-key java-mode-map [(control c)(control e)(s)] 'eclim-java-find-references)
  (define-key java-mode-map [(F2)] 'eclim-java-show-documentation-for-current-element)
  (define-key java-mode-map [(shift F6)] 'eclim-java-refactor-rename-symbol-at-point)
  (define-key java-mode-map [(control c)(c)] 'eclim-maven-run)
  (message "beonit jdee-mode done")
  )
(add-hook 'java-mode-hook 'my-eclim-java-mode-hook)

(setq eclimd-default-workspace "~/workspace/")
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)
(setq eclim-auto-save t)
