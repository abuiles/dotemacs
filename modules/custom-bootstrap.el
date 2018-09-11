;; Install paradox if not avaialble
;; https://github.com/Malabarba/paradox
(when (not (package-installed-p 'paradox))
  (package-install 'paradox))

(paradox-require 'use-package)
(require 'use-package)

;; Finally, we enable `use-package-always-ensure' which makes
;; use-package install every declared package automatically from ELPA,
;; instead of expecting you to do it manually.
(setq use-package-always-ensure t)


;; Multiple cursors for emacs.
;;  https://github.com/magnars/multiple-cursors.el
(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-c C-c") 'mc/edit-lines)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-*") 'mc/mark-all-like-this))


;; https://github.com/magnars/expand-region.el
;; Emacs extension to increase selected region by semantic units.
(use-package expand-region
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (delete-selection-mode 1))

;; https://github.com/Wilfred/ag.el
;; An Emacs frontend to The Silver Searcher http://agel.readthedocs.org/en/latest/
(use-package ag
  :ensure t
  :config
  (setq ag-highlight-search t))

;; https://github.com/jacktasia/dumb-jump
;; an Emacs "jump to definition" package
(use-package dumb-jump
  :ensure t
  :config
  (dumb-jump-mode))

(provide 'custom-bootstrap)
