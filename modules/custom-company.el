(use-package company
  :ensure t)
(use-package company-web
  :ensure t)
(use-package company-tern
  :ensure t)

(require 'company)
(add-to-list 'company-backends 'company-tern)
(add-to-list 'company-backends 'company-web-html)
(add-hook 'after-init-hook 'global-company-mode)

(provide 'custom-company)
