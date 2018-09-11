(use-package company
  :ensure t)
(use-package web-mode
  :ensure t)
(use-package flycheck-flow
  :ensure t)

(require 'company)
(require 'web-mode)
(require 'flycheck)
(require 'flycheck-flow)

(use-package company-flow
  :ensure t)

(use-package flycheck-flow
  :ensure t)

;; flow auto complete
;; skip this if you don't use company-mode
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-flow))

;; add eslint and flow checkers to flycheck
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-flow 'web-mode)

(add-hook 'js2-mode-hook 'flow-enable-automatically)
(add-hook 'web-mode-hook 'flow-enable-automatically)
(add-hook 'javascript-mode-hook 'flow-enable-automatically)

;;disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

(with-eval-after-load 'flycheck
  (flycheck-add-mode 'javascript-flow 'flow-mode)
  (flycheck-add-mode 'javascript-eslint 'flow-mode)
  (flycheck-add-next-checker 'javascript-flow 'javascript-eslint))

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-flow))


(provide 'flowlint)
