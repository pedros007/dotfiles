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

(add-to-list 'auto-mode-alist '("\\.js.erb\\'" . javascript-mode))

; Python Jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

; Restructured Text changes for black backgrounds:see:
; http://laclefyoshi.blogspot.com/2011/02/setting-syntax-coloring-for-rstel.html
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rst-level-1 ((t (:background "black" :foreground "red"))))
 '(rst-level-2 ((t (:background "black" :foreground "red"))))
 '(rst-level-3 ((t (:background "black" :foreground "red"))))
 '(rst-level-4 ((t (:background "black" :foreground "red"))))
 '(rst-level-5 ((t (:background "black" :foreground "red"))))
 '(rst-level-6 ((t (:background "black" :foreground "red")))))
