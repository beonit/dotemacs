(ecb-layout-define "left16" left nil
                   (ecb-set-directories-buffer)
                   (ecb-split-ver 0.15 t)
                   (other-window 1)
                   (ecb-set-sources-buffer)
                   (ecb-split-ver 0.15 t)
                   (other-window 1)
                   (ecb-set-methods-buffer)
                   (other-window 1))
(setq ecb-layout-name "left16")

(define-key ecb-mode-map (kbd "M-1") 'ecb-goto-window-directories)
(define-key ecb-mode-map (kbd "M-2") 'ecb-goto-window-methods)
(define-key ecb-mode-map (kbd "M-3") 'ecb-goto-window-edit1)
(define-key ecb-mode-map (kbd "M-4") 'ecb-goto-window-edit2)

