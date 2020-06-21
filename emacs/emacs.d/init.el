;; -*- emacs-lisp -*-
;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)               ;; Initialize & Install Package

(unless package-archive-contents   ;; Refresh the package descriptions
  (package-refresh-contents))
(setq package-load-list '(all))    ;; List of packages to load

;; Setup built using https://pages.sachachua.com/.emacs.d/Sacha.html

;; Setup use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Use-package setup
(require 'use-package)
(setq use-package-verbose t)
(setq use-package-always-ensure t)

(load-theme 'leuven t)

;; From https://pages.sachachua.com/.emacs.d/Sacha.html
(defun my/reload-emacs-configuration ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(use-package better-defaults :ensure t)
(use-package diminish :ensure t)

;; Org mode setup
(use-package org
  :ensure t
  :pin org
  :config
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t)
  (setq org-agenda-files '("~/org_tracking")))

;; Evil setup
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :init
  (evil-collection-init 'which-key))

;; Compact mode line
(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'light)
  (sml/setup))

;; which-key
(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
	which-key-side-window-max-width 0.33
	which-key-idle-delay 0.05))

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

;; Projectile
(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package command-log-mode
  :ensure t)

(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t
  :after (evil magit))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ab0e54d683d251ceee2b7c9de7cb486a960a29fb84b56acbff86a355c7d96ed8")))
 '(package-selected-packages
   (quote
    (ivy command-log-mode evil-collection use-package org evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
