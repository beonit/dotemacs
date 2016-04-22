;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; agenda setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tasks And States
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "DONE(d!/!)")
              (sequence "PLM(P)" "PBS(p)" "PERFORCE(f)" "REVIEW(r)" "INTEGRATE(i)")
              (sequence "WAITING(w!)" "SOMEDAY(S!)" "|" "CANCELLED(c@/!)" "DELEGATE(D)")
              (sequence "OPEN(O!)" "|" "CLOSED(C!)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("STARTED" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)

              ("PLM" :foreground "cyan" :weight bold)
              ("PBS" :foreground "blue" :weight bold)
              ("PERFORCE" :foreground "blue" :weight bold)
              ("REVIEW" :foreground "blue" :weight bold)
              ("INTEGRATE" :foreground "blue" :weight bold)

              ("WAITING" :foreground "orange" :weight bold)
              ("SOMEDAY" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("OPEN" :foreground "blue" :weight bold)
              ("CLOSED" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)


(setq org-agenda-files '("~/org/todo.org"))
(defun my-org-mode-hook ()
  (message "beonit org mode")
  (define-key org-mode-map "\C-ca" 'org-agenda)
  (define-key org-mode-map (kbd "M-O") 'org-todo)
  (define-key org-mode-map (kbd "C-,") 'helm-buffers-list)
  (define-key org-mode-map (kbd "C-c o") 'org-open-at-point)
  (define-key org-mode-map (kbd "C-c l") 'org-store-link)
  (define-key org-mode-map (kbd "C-c C-l") 'org-insert-link)
  (org-bullets-mode t)
  (message "beonit org mode hook")
)
(add-hook 'org-mode-hook 'my-org-mode-hook)

(require 'org-bullets)
;; (defun org-bullets-mode-hook ()
;;   (when (and (stringp buffer-file-name)
;;              (string-match "doc.org" buffer-file-name))
;;     (org-bullets-mode 1)))

;; (add-hook 'org-mode-hook 'org-bullets-mode-hook)

(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
