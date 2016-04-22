(global-set-key  [(control x)(control b)] 'ido-switch-buffer)
(global-set-key [C-kanji] 'set-mark-command)
(global-set-key "\C-cc" 'compile)
(global-set-key [(control z)] 'undo)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)
(global-set-key  (kbd "C-h") 'delete-backward-char)
(global-set-key  (kbd "M-h") 'backward-kill-word)
(global-set-key  "\M-g" 'goto-line)
(define-key global-map [(control meta \;)] 'comment-or-uncomment-region)
(global-set-key (kbd "C-,") 'helm-buffers-list)
(global-set-key (kbd "M-,") 'ibuffer)
(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key [F11] 'toggle-frame-fullscreen)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

(global-set-key  [(meta shift p)] '(lambda () (interactive) (scroll-down 3)))
(global-set-key  [(meta shift n)] '(lambda () (interactive) (scroll-up 3)))

(global-set-key (quote [M-down]) (quote scroll-up-line))
(global-set-key (kbd "M-N") (quote scroll-up-line))
(global-set-key (quote [M-up]) (quote scroll-down-line)) 
(global-set-key (kbd "M-P") (quote scroll-down-line))

(global-set-key  [(meta p)] 'backward-paragraph)
(global-set-key  [(meta n)] 'forward-paragraph)

(global-set-key  [(f12)] '(lambda () (interactive)
                                   (progn (find-file "~/org/pomodoro.org")
                                          (show-all))))
(global-set-key  [(meta f11)] `(lambda () (interactive)
                           (progn (find-file "~/org/scrach.org")
                                  (show-all))))
(global-set-key  [(control f11)] `(lambda () (interactive)
                           (progn (find-file "~/org/todo.org")
                                  )))

(global-set-key  (kbd "<C-f2>") 'bm-toggle)
(global-set-key  (kbd "<f2>")   'bm-next)
(global-set-key  (kbd "<S-f2>") 'bm-previous)

(global-set-key  [(f6)]
                (lambda(query)
                  (interactive
                   (list (read-from-minibuffer "occur : " (concat (thing-at-point 'symbol) "") nil nil)))
                  (occur query)
                  ))
(global-set-key  [(control f6)] '(lambda() (interactive) (occur (thing-at-point 'symbol))))

;; keybindings
(global-set-key  (kbd "<f11>") 'toggle-window-dedicated)

;; ;; cscope keys
;; ;; http://coder.cl/2009/08/emacs-and-integrating-ecb-with-cscope/
;; (define-key global-map [(f8)] 'cscope-find-this-symbol)
;; (define-key global-map [(control meta g)] 'cscope-find-global-definition)
(define-key global-map [(meta D)] 'cscope-find-global-definition-no-prompting)
(define-key global-map [(control meta m)] 'my-cscope-pop-mark)
(define-key global-map [(control meta M)] 'my-cscope-unpop-mark)
(define-key global-map [(control c)(n)] 'cscope-next-symbol)
(define-key global-map [(control c)(N)] 'cscope-next-file)
(define-key global-map [(control c)(p)] 'cscope-prev-symbol)
(define-key global-map [(control c)(P)] 'cscope-prev-file)
(define-key global-map [(control meta c)] 'cscope-display-buffer)

;; (define-key global-map [(control f8)] 'cscope-display-buffer-toggle)
;; (define-key global-map [(control meta l)] 'my-cscope-lgrep-this-file)
;; (define-key global-map [(control meta l)] 'my-cscope-lgrep-this-file)
;; (define-key global-map [(control c)(s)(k)] 'my-cscope-find-class-definistion)
;; (define-key global-map [(control c)(s)(j)] 'my-cscope-find-base-definistion)
;; (define-key global-map [(control c)(s)(a)] 'my-cscope-find-function-arg)

(global-set-key  [(meta f12)] 'make-frame-and-cscope-find-definition)
(global-set-key  [(control c)(s)(D)] 'make-frame-and-cscope-find-definition)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "C-x t") 'helm-mt)
(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
(define-key comint-mode-map (kbd "M-p") 'comint-previous-input)
(define-key comint-mode-map (kbd "<down>") 'comint-next-input)
(define-key comint-mode-map (kbd "M-n") 'comint-next-input)
