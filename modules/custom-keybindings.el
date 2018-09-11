(global-set-key (kbd "C-l") 'backward-word)
(global-set-key (kbd "C-;") 'forward-word)
(global-set-key (kbd "C-@") 'mark-word)
(global-set-key (kbd "C-c C-d") 'kill-word)

(global-set-key (kbd "M-f") 'identity)
(global-set-key (kbd "M-b") 'identity)
(global-set-key (kbd "M-@") 'identity)
(global-set-key (kbd "M-d") 'identity)

(global-set-key (kbd "C-c C-n") 'ember-test)
(global-set-key (kbd "C-c m") 'ember-test-filter)


(provide 'custom-keybindings)
