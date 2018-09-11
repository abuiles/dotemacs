;; http://stackoverflow.com/questions/13185729/npm-dont-display-prompt-correctly-under-emacs-eshell
;; fix issue with weird chars in sheell
;; comint-preoutput-filter-functions when nil
(setf comint-preoutput-filter-functions nil)

(add-to-list
 'comint-preoutput-filter-functions
 (lambda (output)
   (replace-regexp-in-string "\033\[[0-9]+[GKJLlh]" "" output)))
(put 'upcase-region 'disabled nil)

(provide 'custom-shell)
