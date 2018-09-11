(use-package magit
  :ensure t)

(defalias 'git 'magit-status)
(defalias 'blame 'magit-blame-mode)

;; (require 'magit-gh-pulls)
;; (add-hook 'magit-mode-hlook 'turn-on-magit-gh-pulls); Before running Git, Magit by default reverts all unmodified
;; buffers which visit fil'tracked in the current repository.
;; This can potentially lead to dataloss so you might want to
;; disable this by adding the following line to your init file:
(setq magit-auto-revert-mode nil)
(setq magit-push-current-set-remote-if-missing t)

(provide 'custom-magit)
