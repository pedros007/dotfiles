; ELPA (aka package.el)
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
	'( magit yaml-mode psvn js2-mode jedi-direx jedi ac-js2 robe flymake-cursor flymake-ruby flymake-yaml flymake-shell flymake-jshint rspec-mode org-mobile-sync yasnippet))
  ;;install the missing packages
  (dolist (package my-required-packages)
    (unless (package-installed-p package)
      (package-install package)))
  )

;; Extra modes

;; org-mode
;; Set to the location of your Org files on your local system
(setq org-directory "~/org/")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg/")

;; Interactively Do Things (Ido)
(require 'ido)
(ido-mode t)
;; Flex matching: "wc" matches "widgets.c"
(setq ido-enable-flex-matching t)

(add-hook 'sh-mode-hook 'flymake-shell-load)

(add-to-list 'load-path "~/.emacs.d/modes")
(require 'psvn)
(require 'mapserver-mode)
;; (require 'bundler)

;; Lets go ahead and turn on yasnippet mode.
(require 'yasnippet)
(eval-after-load 'yasnippet
  '(progn
     (message "yas global mode")
     (yas-global-mode 1)))

(require 'rspec-mode)
(eval-after-load 'rspec-mode
  (rspec-install-snippets))
;; Without this, rspec-mode cannot find bundler.
;;(setq rspec-use-spring-when-possible nil)
;; Scroll to the first test failure
(setq compilation-scroll-output 'first-error)

; (add-to-list 'auto-mode-alist
; 	     '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
 	     '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

(require 'auto-complete-config)
(ac-config-default)
;; Get auto-complete and yasnippet to play nicely: http://stackoverflow.com/a/25682651/40785
(defun add-yasnippet-ac-sources ()
  (add-to-list 'ac-sources 'ac-source-yasnippet))


(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(global-set-key (kbd "C-c [") 'flymake-goto-prev-error)
(global-set-key (kbd "C-c ]") 'flymake-goto-next-error)
(global-set-key (kbd "C-c \\") 'flymake-display-err-menu-for-current-line)

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'add-yasnippet-ac-sources)

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
;; proper indentation of js files: http://feeding.cloud.geek.nz/posts/proper-indentation-of-javascript-files/
;(custom-set-variables  
; '(js2-basic-offset 2)  
; '(js2-bounce-indent-p t)  
;)

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
