(require 'package)
(add-to-list
 'package-archives
 ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
 '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)
;; Bootstrap 'use-package'
(eval-after-load 'gnutls
  '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)

(setq magit-last-seen-setup-instructions "1.4.0")

;; (package-initialize) ;; You might already have this line

(setq make-backup-files nil)

(setq ns-command-modifier 'meta)
(setq ns-pop-up-frames nil)

;; Don't show the startup screen
(setq inhibit-startup-message t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; turn-off alarms
(setq ring-bell-function 'ignore)
(ido-mode t)


;; Delete trailing whitespace before saving
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; (global-set-key (kbd "M-s RET") 'ns-toggle-fullscreen)
;; (setq ns-alternate-modifier nil)
(setq ns-use-native-fullscreen nil)
(global-set-key (kbd "M-s RET") 'toggle-frame-fullscreen)

(setq user-mail-address "builes.adolfo@gmail.com")
(setq user-full-name "Adolfo Builes")

;; Save emacs backup files in tmp.
;; store all autosave files in the tmp dir
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; backups in backup dir
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs.d/backup"))
      delete-old-versions t
      kept-new-versions 24
      kept-old-versions 12
      version-control t)

;; Remember my place in files across sessions
;; saveplace remembers your location in a file when saving files
;; (setq save-place-file (concat user-emacs-directory "saveplace"))
;; ;; activate it for all buffers
;; (setq-default save-place t)
;; (require 'saveplace)

(setenv "PATH" (concat (getenv "PATH") ":/bin"))
(setq exec-path (append exec-path '("/bin")))
(put 'narrow-to-page 'disabled nil)

(setq create-lockfiles nil)

(blink-cursor-mode t)
(show-paren-mode t)

(setq search-highlight t)
(setq query-replace-highlight t)

;; This should fix the clipboard
(setq x-select-enable-clipboard t)
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key [(meta g)] 'goto-line)

;; Tabs replacement
(setq-default indent-tabs-mode nil)

;; Show the trailing whitespace
(setq-default show-trailing-whitespace t)
;; taken from http://schlotter.org/pub/dotemacs

(defun turn-off-show-trailing-whitespace ()
  "Turn on the highlighting of trailing whitespace in this buffer."
  (interactive)
  (setq show-trailing-whitespace nil))


(global-set-key [f5] 'call-last-kbd-macro)
(global-set-key [f3] 'align-regexp)
(global-set-key [f4] 'sort-lines)
(global-set-key [f6] 'delete-trailing-whitespace)

;; Automatically indendent pasted code
(electric-indent-mode 1)
(dolist (command '(yank yank-pop))
   (eval `(defadvice ,command (after indent-region activate)
            (and (not current-prefix-arg)
                 (member major-mode '(emacs-lisp-mode lisp-mode
                                                      clojure-mode    scheme-mode
                                                      haskell-mode    ruby-mode
                                                      rspec-mode      python-mode
                                                      c-mode          c++-mode
                                                      objc-mode       latex-mode
                                                      plain-tex-mode  javascript-mode))
                 (let ((mark-even-if-inactive transient-mark-mode))
                   (indent-region (region-beginning) (region-end) nil))))))

(column-number-mode)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(add-hook 'term-mode-hook 'turn-off-show-trailing-whitespace)

;; Open Shells

(defun my-shell (arg)
  (interactive "p")
  (let ((arg (or arg 1)))
    (shell (format "*sh%d*" arg))))


(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z 1") '(lambda () (interactive) (my-shell 1)))
(global-set-key (kbd "C-z 2") '(lambda () (interactive) (my-shell 2)))
(global-set-key (kbd "C-z 3") '(lambda () (interactive) (my-shell 3)))
(global-set-key (kbd "C-z 4") '(lambda () (interactive) (my-shell 4)))
(global-set-key (kbd "C-z 5") '(lambda () (interactive) (my-shell 5)))
(global-set-key (kbd "C-z 8") 'multi-term-next)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-indent-level 2)
 '(css-indent-offset 2)
 '(custom-safe-themes
   (quote
    ("89dd0329d536d389753111378f2425bd4e4652f892ae8a170841c3396f5ba2dd" default)))
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(jsx-indent-level 2)
 '(menu-bar-mode t)
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(package-selected-packages
   (quote
    (direnv csv-mode csv visual-fill-column org-preview-html paradox go-dlv rails-log-mode php-mode company-web-html vue-mode prettier-js robe counsel elixir-yasnippets elixir-mode web-beautify highlight graphql-mode markdown-mode tide terraform-mode docker-compose-mode docker magit htmlize mu4e org-jira nvm typescript-mode flymake-solidity solidity-mode git-link yasnippet dumb-jump flow-minor-mode ace-window company-flow add-node-modules-path rjsx-mode flycheck-flow exec-path-from-shell json-mode js2-mode flycheck jsx-mode editorconfig eslint-fix flow-mode zencoding-mode zen-mode yaml-mode web-mode swift-mode scss-mode rvm ruby-block rubocop rspec-mode request quasi-monochrome-theme projectile-rails projectile-codesearch pivotal-tracker pandoc-mode ox-gfm org moe-theme magit-popup magit-gh-pulls js2-refactor grizzl go-mode gist expand-region enh-ruby-mode emojify ember-yasnippets dockerfile-mode diff-hl company-web company-tern cmake-mode avy alchemist ag)))
 '(rspec-use-spring-when-possible t)
 '(safe-local-variable-values
   (quote
    ((org-publish-project-alist
      ("books" :base-directory "~/code/abuiles.com/books/src" :publishing-directory "~/code/abuiles.com/books/" :publishing-function org-html-publish-to-html :with-author nil :with-timestamps nil :html-postamble nil :section-numbers nil))
     (org-publish-project-alist
      ("books" :base-directory "~/code/books/src" :publishing-directory "~/code/books/" :publishing-function org-html-publish-to-html :with-author nil :with-timestamps nil :html-postamble nil :section-numbers nil))
     (eval progn
           (add-to-list
            (quote exec-path)
            (concat
             (locate-dominating-file default-directory ".dir-locals.el")
             "node_modules/.bin/"))))))
 '(send-mail-function nil)
 '(term-default-bg-color "#000000")
 '(term-default-fg-color "#00F94F")
 '(tide-tsserver-executable "\"/Users/abuiles/.nvm/versions/node/v8.1.3/bin/tsserver\"")
 '(tramp-syntax (quote default) nil (tramp))
 '(typescript-indent-level 2)
 '(web-mode-attr-indent-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-markup-indent-offset 2))

;; foreground color (yellow)

(add-to-list 'completion-ignored-extensions ".rbc")

;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
;; From Emacs wiki
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; MS Windows clipboard is UTF-16LE
(set-clipboard-coding-system 'utf-16le-dos)


;; ;; Markdown
;; (setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))
;; (setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; ;;Yaml-mode
(use-package yaml-mode
             :ensure t)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; enh-ruby-mode FIX-ME
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)

(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)

(use-package ruby-block
  :ensure t)

(require 'ruby-block)
(ruby-block-mode t)

(require 'cl)

;; Projectile

(use-package ivy
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))


(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'ivy)
;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
;; (add-hook 'projectile-mode-hook 'projectile-rails-on)

;; Flyspell
(setq flyspell-issue-message-flg nil)
(add-hook 'enh-ruby-mode-hook
          (lambda () (flyspell-prog-mode)))

;; TODO: REVIEW
(auto-fill-mode nil)

;; ansi-term colors
(setq ansi-term-color-vector
      [term term-color-black term-color-red term-color-green term-color-yellow
            term-color-blue term-color-magenta term-color-cyan term-color-white])

(setq default-tab-width 2)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Start emacsclient
(add-hook 'after-init-hook 'server-start)

(setenv "NODE_NO_READLINE" "1")
;;
;; Figure out the path to our .emacs.d by getting the path part of the
;; current file (`init.el`).
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) (file-chase-links load-file-name))))


(add-to-list 'load-path (concat dotfiles-dir "modules"))

(require 'custom-bootstrap)
(require 'custom-snippets)
(require 'font)
(require 'color)
(load-theme 'zenburn t)

(require 'custom-keybindings)
(require 'custom-company)
(require 'custom-ispell)
(require 'custom-magit)
(require 'utils)
(require 'custom-shell)
(require 'custom-node-env)
(require 'custom-js)
(require 'custom-eslint)
(require 'custom-git)
(require 'elixir)
(require 'ruby)
(require 'markdown)
(require 'ios)
(require 'go)

;; (require 'custom-ext-window-nav)
;; (require 'custom-exec-path)
(require 'custom-react)
;; (require 'solidity)
(require 'custom-typescript)
;; (require 'jira)
;; (require 'custom-mu4e)
(put 'downcase-region 'disabled nil)

(require 'orgconf)
(require 'direnvenv)
