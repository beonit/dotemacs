(require 'p4)
(p4-set-p4-executable "/usr/bin/p4")
(setenv "P4USER" "s-han.lee")

(defun p4env-get (workspace arg)
  (let ((p4-project-path "/home/owner/workspace/p4/p4projects"))
    (subseq
     (shell-command-to-string
      (format "cat %s | grep %s | awk -F'\t' '{print $%d}'" p4-project-path workspace arg))
     0 -1))
  )

(defvar p4workspace nil workspace)
(defun p4env (workspace)
  (interactive (list (read-from-minibuffer "p4 env : " nil nil nil)))
  (let ((p4-project-path "/home/owner/workspace/p4/p4projects"))
    (setq p4workspace workspace)
    (setenv "P4PORT" (p4env-get workspace 2))
    (setenv "P4CLIENT" (p4env-get workspace 3))
    (setenv "P4BUILD_PATH" (p4env-get workspace 4))
    (setq p4-build-path (concat "/home/owner/" (p4env-get workspace 4) "/" workspace))
  )
  (message (format "P4CLIENT : %s\nP4PORT : %s" (getenv "P4CLIENT") (getenv "P4PORT"))))
