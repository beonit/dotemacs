(require 'xcscope)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my-cscope-pop,uppop-mark
(defvar my-cscope-marker-ring (make-ring cscope-marker-ring-length))
(defun my-cscope-pop-mark ()
  "pop back to where and can repush mark"
  (interactive)
  (if (ring-empty-p cscope-marker-ring)
      (error "There are no marked buffers in the cscope-marker-ring yet"))
  (ring-insert my-cscope-marker-ring (point-marker))
  (cscope-pop-mark)
  )

(defun my-cscope-unpop-mark ()
  "Pop back to where cscope was last invoked."
  (interactive)

  ;; This function is based on pop-tag-mark & cscope-pop-mark, which can be found in
  ;; lisp/progmodes/etags.el.
  ;; xescope.el

  (if (ring-empty-p my-cscope-marker-ring)
      (error "There are no marked buffers in the my-cscope-marker-ring yet"))
  (let* ( (marker (ring-remove my-cscope-marker-ring 0))
	  (old-buffer (current-buffer))
	  (marker-buffer (marker-buffer marker))
	  marker-window
	  (marker-point (marker-position marker))
	  (cscope-buffer (get-buffer cscope-output-buffer-name)) )

    ;; After the following both my-cscope-marker-ring and cscope-marker will be
    ;; in the state they were immediately after the last search.  This way if
    ;; the user now makes a selection in the previously generated *cscope*
    ;; buffer things will behave the same way as if that selection had been
    ;; made immediately after the last search.
    (ring-insert cscope-marker-ring (point-marker))
    (setq cscope-marker marker)

    (if marker-buffer
	(if (eq old-buffer cscope-buffer)
	    (progn ;; In the *cscope* buffer.
	      (set-buffer marker-buffer)
	      (setq marker-window (display-buffer marker-buffer))
	      (set-window-point marker-window marker-point)
	      (select-window marker-window))
	  (switch-to-buffer marker-buffer))
      (error "The marked buffer has been deleted"))
    (goto-char marker-point)
    (set-buffer old-buffer)))
