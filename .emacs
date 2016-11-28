;;; package --- https://github.com/pedros007/dotfiles/blob/master/.emacs
;;; Commentary:
;; Colors will look better if you run Emacs with environment variable
;; `TERM=xterm-256color`.  This file is from
;; https://github.com/pedros007/dotfiles/blob/master/.emacs

;;; Code:
(when (>= emacs-major-version 24)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Setup package manager & install packages I happen to like.
  (require 'package)  
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			   ("marmalade" . "http://marmalade-repo.org/packages/")
			   ("melpa" . "http://melpa.org/packages/"))) ;; See https://github.com/melpa/melpa/issues/4156 for a mirror: https://elpa.zilongshanren.com

  ;; activate all the packages
  (package-initialize)
  ;; fetch the list of packages available
  (unless package-archive-contents
    (package-refresh-contents))
  ;;Install packages which I want.
  (setq my-required-packages 
	'( magit yaml-mode js2-mode ac-js2 robe jedi-direx jedi flycheck nginx-mode dockerfile-mode markdown-mode go-mode go-guru go-autocomplete))
  ;;install the missing packages
  (dolist (package my-required-packages)
    (unless (package-installed-p package)
      (package-install package)))


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; General-purpose development stuff:

  ;; flycheck - a modern replacement for flymake
  (global-flycheck-mode)`

  ;; Interactively Do Things (Ido)
  (require 'ido)
  (ido-mode t)
  ;; Flex matching: "wc" matches "widgets.c"
  (setq ido-enable-flex-matching t)

  ;; Autocomplete
  (require 'auto-complete-config)
  (ac-config-default)

  ;; Interpret ANSI color codes for a buffer: http://stackoverflow.com/a/23382008/40785
  (require 'ansi-color)
  (defun display-ansi-colors ()
    (interactive)
    (ansi-color-apply-on-region (point-min) (point-max)))

  ;; Custom modes
  (add-to-list 'load-path "~/.emacs.d/modes")
  ;;(require 'mapserver-mode)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Language-specfici development stuff:

  ;; go development
  (require 'go-autocomplete)
  (require 'auto-complete-config)
  (ac-config-default)

  (add-hook  'go-mode-hook 'go-guru-hl-identifier-mode)

  (require 'go-eldoc)
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook #'gofmt-before-save)

  ;; Ruby & Rails development
  (add-to-list 'auto-mode-alist
	       '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook 'robe-mode)

  ;; JavaScript development
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  (add-hook 'js-mode-hook 'js2-minor-mode)
  (add-hook 'js2-mode-hook 'ac-js2-mode)
  (setq ac-js2-evaluate-calls t)
  ;; do not use tabs for indent
  (setq js2-mode-hook
	'(lambda () (progn
		      (set-variable 'indent-tabs-mode nil))))
  (add-to-list 'auto-mode-alist
	       '("\\(js.erb\\)\\'". javascript-mode))

  ;; JSON editing
    (setq json-mode-hook
	'(lambda () (progn
		      (set-variable 'indent-tabs-mode nil))))

  ;; Python development
  (setq jedi:setup-keys t)                      ; optional
  (setq jedi:complete-on-dot t)                 ; optional
  (add-hook 'python-mode-hook 'jedi:setup)
  )
