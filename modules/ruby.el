(use-package rvm
  :ensure t)

(use-package rubocop
  :ensure t)

(use-package robe
  :ensure t)

(use-package projectile-rails
  :ensure t
  :config
  (projectile-rails-global-mode))

(add-hook 'ruby-mode-hook 'robe-mode)

(require 'rvm)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(provide 'ruby)
