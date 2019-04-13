(defun google-region (beg end)
  "Google the selected region."
  (interactive "r")
  (browse-url (concat "http://www.google.com/search?q=" (buffer-substring beg end))))

;; ember-test
(defun ember-test (beg end)
  "run ember test with selected module."
  (interactive "r")
  (browse-url (concat "https://dashboard.envoy.dev/tests?module=" (buffer-substring beg end))))

;; ember-test with filter
(defun ember-test-filter (beg end)
  "run ember test with selected module."
  (interactive "r")
  (browse-url (concat "https://dashboard.envoy.dev/tests?filter=" (buffer-substring beg end))))

(defun translate-region (beg end)
  "Show the translation for the selected word."
  (interactive "r")
  (browse-url (concat "http://www.wordreference.com/es/translation.asp?tranword=" (buffer-substring beg end))))


(defun rae-region (beg end)
  "Show the RAE definition for the selected word."
  (interactive "r")
  (browse-url (concat "http://buscon.rae.es/drae/?val=" (buffer-substring beg end))))

(defun say (beg end)
  "Calls say with the selected region"
  (interactive "r")
  (shell-command (concat "say " (buffer-substring beg end))))

(defun camelize (s c)
  "Convert under_score string S to CamelCase string."
  (let ((tok (split-string s c)))
    (concat (car tok)
            (mapconcat #'(lambda (word) (capitalize (downcase word)))
                       (cdr tok) ""))))

(defun camelize-region (beg end c)
  (save-excursion
    (let ((c (camelize (buffer-substring-no-properties beg end) c)))
      (delete-region beg end)
      (goto-char (min beg end))
      (insert-before-markers c))))

(defun camelize-next-kebab ()
  "Camelize the next snake cased string.
If transient-mark-mode is active and a region is activated,
camelize the region."
  (interactive)
  (let (beg end)
    (if (and (boundp 'transient-mark-mode) transient-mark-mode mark-active)
        (setq beg (mark)
              end (point))
      (setq beg (point)
            end (+ beg (skip-chars-forward "[:alnum:]-"))))
    (camelize-region beg end "-")))

(defun camelize-next-snake ()
  "Camelize the next snake cased string.
If transient-mark-mode is active and a region is activated,
camelize the region."
  (interactive)
  (let (beg end)
    (if (and (boundp 'transient-mark-mode) transient-mark-mode mark-active)
        (setq beg (mark)
              end (point))
      (setq beg (point)
            end (+ beg (skip-chars-forward "[:alnum:]_"))))
    (camelize-region beg end "_")))

(defun camelize-previous-kebab ()
  "Camelize the next snake cased string.
If transient-mark-mode is active and a region is activated,
camelize the region."
  (interactive)
  (let (beg end)
    (if (and (boundp 'transient-mark-mode) transient-mark-mode mark-active)
        (setq beg (mark)
              end (point))
      (setq end (point)
            beg (+ end (skip-chars-backward "[:alnum:]-"))))
    (camelize-region beg end "-")))

(global-set-key (kbd "C-c C-r") 'camelize-next-kebab)
(global-set-key (kbd "C-c C-u") 'camelize-next-snake)
(global-set-key (kbd "C-c C-m") 'say)

(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
    )
  )

;; thanks to https://twitter.com/#!/bbatsov/status/161812683837030400
(defun bbatsov-kill-buffers ()
  "Kill all buffers but the current one"
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (eql buffer (current-buffer))
      (kill-buffer buffer))))

(global-set-key (kbd "C-c k o") 'bbatsov-kill-buffers)

(provide 'utils)
