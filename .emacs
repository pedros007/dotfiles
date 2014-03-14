; standard things
(global-set-key (kbd "C-c C-g") 'goto-line)
(set-face-foreground 'minibuffer-prompt "cyan")

; Extra modes
; Interactively Do Things (Ido)
(require 'ido)
(ido-mode t)

(add-to-list 'load-path "~/.emacs.d/modes")
(require 'psvn)

(add-to-list 'load-path "~/.emacs.d/modes/yaml-mode/")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-to-list 'load-path "~/.emacs.d/modes/ruby-mode/")
(require 'ruby-mode)
(add-to-list 'auto-mode-alist
	     '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
	     '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

; Python Jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional
