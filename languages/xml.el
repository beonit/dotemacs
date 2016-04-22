(defun my-nxml-mode-hook()
  (setq indent-tabs-mode t)
  (setq nxml-child-indent 4)
  )

(add-hook 'nxml-mode-hook 'my-nxml-mode-hook)
