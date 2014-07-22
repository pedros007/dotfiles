; standard things
(global-set-key (kbd "C-c C-g") 'goto-line)
(set-face-foreground 'minibuffer-prompt "cyan")

; ELPA (aka package.el)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

; Extra modes
; Interactively Do Things (Ido)
(require 'ido)
(ido-mode t)

(add-to-list 'load-path "~/.emacs.d/modes")
(require 'psvn)
(require 'mapserver-mode)

(add-to-list 'load-path "~/.emacs.d/modes/yaml-mode/")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-to-list 'load-path "~/.emacs.d/modes/ruby-mode/")
(require 'ruby-mode)
(add-to-list 'auto-mode-alist
	     '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
	     '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

; yasnippet by default reads from ~/.emacs.d/snippets
(require 'yasnippet)
(yas-global-mode 1)

; autocomplete is useful in a variety of situations.
(require 'auto-complete-config)
(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

; JavaScript js2-mode and autocomplete
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

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