;; Thomas vanBommel
;; Created:  2022-01-10
;; Modified: 2022-03-23

;; Remove tool bars
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Change theme
(load-theme 'tango-dark t)

;; Stop creating backup and autosave files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Add ~/.emacs.d/lisp to load-path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Initialize package
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install / Initialize use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; Add Magit
(use-package magit
  :ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (go-complete go-mode use-package magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Bind magit-status to 'C-c g'
(define-key global-map (kbd "C-c g") 'magit-status)

;; Add go-mode
(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))
(require 'go-mode)

;; auto-complete
;;(unless (package-installed-p 'auto-complete)
;;  (package-install 'auto-complete))
(require 'auto-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
