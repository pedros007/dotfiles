(when (>= emacs-major-version 24)
  (require 'package)  
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  ;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

  ;; activate all the packages
  (package-initialize)
  ;; fetch the list of packages available
  (unless package-archive-contents
    (package-refresh-contents))
  ;;Install packages which I want.
  (setq my-required-packages 
	'( magit yaml-mode psvn js2-mode jedi-direx jedi ac-js2 robe flycheck org-mobile-sync nginx-mode dockerfile-mode markdown-mode go-mode go-autocomplete))
  ;;install the missing packages
  (dolist (package my-required-packages)
    (unless (package-installed-p package)
      (package-install package)))
  )

;; Extra modes

;; flycheck - a modern replacement for flymake
(global-flycheck-mode)`

;; go development
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(setq gofmt-command "goimports")
(add-hook 'before-save-hook #'gofmt-before-save)

;; Interactively Do Things (Ido)
(require 'ido)
(ido-mode t)
;; Flex matching: "wc" matches "widgets.c"
(setq ido-enable-flex-matching t)

(add-to-list 'load-path "~/.emacs.d/modes")
;;(require 'psvn)
;;(require 'mapserver-mode)

(require 'auto-complete-config)
(ac-config-default)


;; Ruby & Rails development
(add-to-list 'auto-mode-alist
 	     '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))
(add-hook 'ruby-mode-hook 'robe-mode)

; JavaScript js2-mode and autocomplete
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)
; do not use tabs for indent
(setq js2-mode-hook
  '(lambda () (progn
    (set-variable 'indent-tabs-mode nil))))
;; proper indentation of js files: http://feeding.cloud.geek.nz/posts/proper-indentation-of-javascript-files/
;(custom-set-variables  
; '(js2-basic-offset 2)  
; '(js2-bounce-indent-p t)  
;)

(add-to-list 'auto-mode-alist
	     '("\\(js.erb\\)\\'". javascript-mode))

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

; magit diff with dark background terminals is very hard to read, so try this:
; https://github.com/magit/magit/issues/865#issuecomment-24273819
(eval-after-load 'magit
  '(set-face-attribute 'magit-item-highlight () :bold t :background ()))
