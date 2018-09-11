(use-package git-link
  :ensure t)


(use-package diff-hl
  :ensure t)

;; diff-hl
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(provide 'custom-git)
