(defun kill-all-dired-buffers()
      "Kill all dired buffers."
      (interactive)
      (save-excursion
        (let ((count 0))
          (dolist(buffer (buffer-list))
            (set-buffer buffer)
            (when (equal major-mode 'dired-mode)
              (setq count (1+ count))
              (kill-buffer buffer)))
          (message "Killed %i dired buffer(s)." count ))))

;; sticky buffer
(define-minor-mode sticky-buffer-mode
  "Make the current window always display this buffer."
  nil " sticky" nil
  (set-window-dedicated-p (selected-window) sticky-buffer-mode))

(defun previous-line-until-char()
  (interactive)
  (if (not (string= " " (char-to-string (char-after))))
      (previous-line))
  (while (string= " " (char-to-string (char-after)))
      (previous-line))
)

(defun next-line-until-char()
  (interactive)
  (if (not (string= " " (char-to-string (char-after))))
      (next-line))
  (while (string= " " (char-to-string (char-after)))
      (next-line))
)

(defun googling (query)
  (interactive (list (read-from-minibuffer "googling : " (concat (thing-at-point 'symbol) "") nil nil)))
  (browse-url (replace-regexp-in-string " " "+" (concat "http://www.google.co.kr/search?ie=UTF-8&q=" (encode-coding-string query 'utf-8)))))

(defun eww-new (query)
  (interactive (list (read-from-minibuffer "eww new tab : " (concat (thing-at-point 'symbol) "") nil nil)))
  (browse-url query))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; grep this file
(defun grep-this-file (query)
  (interactive (list (read-from-minibuffer "grep-string : " (concat (thing-at-point 'symbol) "") nil nil)))
  (grep (concat "find " (file-relative-name (buffer-file-name)) " -type f -exec grep -nH " query " {} +"))
)

(defun org-convert-to-table (beg end)
  (interactive "r")
  (if mark-active
      (let ((query (read-from-minibuffer "cell seperate char : " "	")))
        (save-restriction
          (narrow-to-region beg end)
          (goto-char (point-min))
          (replace-regexp (concat "\\($\\|^\\|" query "\\)") "|"))
        (deactivate-mark)
        )
    (message "no region")))

(defun concatString (list)
  "A non-recursive function that concatenates a list of strings."
  (if (listp list)
      (let ((result ""))
        (dolist (item list)
          (if (stringp item)
              (setq result (concatenate 'string result (concat item " ")))))
        result)))

(eval-after-load "dired-aux"
   '(add-to-list 'dired-compress-file-suffixes
                 '("\\.zip\\'" ".zip" "unzip")))

(eval-after-load "dired-aux"
   '(add-to-list 'dired-compress-file-suffixes
                 '("\\.7z\\'" ".7z" "un7z")))

(eval-after-load "dired"
  '(define-key dired-mode-map "z" 'dired-zip-files))

(defun dired-zip-files (zip-file)
  "Create an archive containing the marked files."
  (interactive "sEnter name of zip file: ")

  ;; create the zip file
  (let ((zip-file (if (string-match ".zip$" zip-file) zip-file (concat zip-file ".zip"))))
    (shell-command
     (concat "zip "
             zip-file
             " "
             (concatString
              (mapcar
               '(lambda (filename)
                  (file-name-nondirectory filename))
               (dired-get-marked-files))))))
  (revert-buffer)
  ;; remove the mark on all the files  "*" to " "
  ;; (dired-unmark-all-marks)
  ;; (dired-change-marks 42 ?\040)
  ;; mark zip file
  ;; (dired-mark-files-regexp (filename-to-regexp zip-file))
  )

(define-key global-map (kbd "%") 'match-paren)
(defun match-paren ()
  "% command of vi"
  (interactive)
  (let ((char (char-after (point))))
    (cond ((memq char '(?\( ?\{ ?\[))
           (forward-sexp 1)
           (backward-char 1))
          ((memq char '(?\) ?\} ?\]))
           (forward-char 1)
           (backward-sexp 1))
          (t (call-interactively 'self-insert-command)))))

(defun my-set-eww-buffer-title ()
  (let* ((title  (plist-get eww-data :title))
         (url    (plist-get eww-data :url))
         (result (concat "*eww - " (or title
                              (if (string-match "://" url)
                                  (substring url (match-beginning 0))
                                url)) "*")))
    (rename-buffer result t)))

(add-hook 'eww-after-render-hook 'my-set-eww-buffer-title)
