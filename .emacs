; standard things
(global-set-key (kbd "C-c C-g") 'goto-line)
(set-face-foreground 'minibuffer-prompt "cyan")

; ELPA (aka package.el)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
; With emacs-24.3.1, install: (magit, yaml-mode, psvn, js2-mode, jedi-direx, jedi, ac-js2,
; rope, flymake-cursor, flymake-ruby, flymake-yaml, flymake-shell, flymake-jshint

; Extra modes
; Interactively Do Things (Ido)
(require 'ido)
(ido-mode t)

(add-hook 'sh-mode-hook 'flymake-shell-load)

(add-to-list 'load-path "~/.emacs.d/modes")
(require 'psvn)
(require 'mapserver-mode)

(add-to-list 'load-path "~/.emacs.d/modes/yaml-mode/")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook 'flymake-yaml-load)

(add-to-list 'load-path "~/.emacs.d/modes/ruby-mode/")
(require 'ruby-mode)
(add-to-list 'auto-mode-alist
	     '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
	     '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(global-set-key (kbd "C-c [") 'flymake-goto-prev-error)
(global-set-key (kbd "C-c ]") 'flymake-goto-next-error)
(global-set-key (kbd "C-c \\") 'flymake-display-err-menu-for-current-line)

(add-hook 'ruby-mode-hook 'robe-mode)

; autocomplete is useful in a variety of situations.
(require 'auto-complete-config)
(ac-config-default)

; JavaScript js2-mode and autocomplete
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js2-mode-hook 'flymake-jshint-load)
(setq ac-js2-evaluate-calls t)
; do not use tabs for indent
(setq js2-mode-hook
  '(lambda () (progn
    (set-variable 'indent-tabs-mode nil))))
; proper indentation of js files: http://feeding.cloud.geek.nz/posts/proper-indentation-of-javascript-files/
(custom-set-variables  
 '(js2-basic-offset 2)  
 '(js2-bounce-indent-p t)  
)

; Python Jedi
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional
(add-hook 'python-mode-hook 'jedi:setup)

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

;; Interpret ANSI color codes for a buffer: http://stackoverflow.com/a/23382008/40785
(require 'ansi-color)
(defun display-ansi-colors ()
  (interactive)
  (ansi-color-apply-on-region (point-min) (point-max)))
