;; Package setup

(require 'package)

(setq package-enable-at-startup nil)
(setq package-archives '(("org" . "https://orgmode.org/elpa/")
			 ("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; Basic customization

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

(menu-bar-mode -1)
(show-paren-mode 1)
(global-linum-mode t)

(require 'ido)
(ido-mode t)

;; Install Packages

(unless(package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package auto-package-update
  :ensure t
  :commands (auto-package-update-now)
  :config
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-delete-old-versions t))

(use-package better-defaults
  :ensure t)

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package material-theme
  :ensure t
  :config
  (load-theme 'material t))

(use-package org
  :ensure t
  :pin org)

(use-package powerline
  :ensure t
  :config
  (powerline-center-evil-theme))

(use-package which-key
	      :ensure t
	      :init
	      (which-key-mode)
	      :config (which-key-setup-side-window-right-bottom)
	      (setq which-key-sort-order 'which-key-key-order-alpha
		    which-key-side-window-max-width 0.33
		    which-key-idle-delay 0.05))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(package-selected-packages
   (quote
    (which-key material-theme evil better-defaults use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
