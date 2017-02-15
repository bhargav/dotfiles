(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'package)

;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository

(setq package-enable-at-startup nil)

;; Activate installed packages
(package-initialize)

(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

;; Essential settings
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
;; (tool-bar-mode -1)
(show-paren-mode t)
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

;; Workaround for El-Capitan
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
;;(setq use-package-verbose t)

;; ido-mde
(require 'ido)
(ido-mode t)

;; evil-mode
(use-package evil
  :ensure t
  :init
  (progn
    (evil-mode t)
    (use-package evil-leader
      :ensure t
      :init (global-evil-leader-mode)
      :config
      (progn
	(evil-leader/set-leader "SPC")
	(evil-leader/set-key "wd" 'delete-window)
	(evil-leader/set-key "wo" 'delete-other-windows)
	(evil-leader/set-key "ws" 'split-window-below)
	(evil-leader/set-key "wh" 'split-window-horizontally)
	(evil-leader/set-key "wv" 'split-window-vertically)
	(evil-leader/set-key "ww" 'other-window)))
    (use-package evil-org
      :ensure t
      :init (add-hook 'org-mode-hook 'evil-org-mode)
      :diminish evil-org-mode)))

;; magit
(use-package magit :ensure t)

;; which-key-mode
(use-package which-key
  :ensure t
  :config
  (progn
    (which-key-mode t)
    (which-key-setup-side-window-right-bottom)))

;; org-mode
(use-package org :ensure t :pin org)

;; helm
(use-package helm
  :ensure t
  :diminish helm-mode
  :commands helm-mode
  :config
  (helm-mode 1))

;; helm-projectile
(use-package helm-projectile
  :commands (helm-projectile helm-projectile-switch-project)
  :ensure t)

;; projectile
(use-package projectile
  :ensure t
  :defer 1
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; python-mode
(use-package python-mode
  :ensure t)

;; ENSIME
(use-package ensime
  :ensure t
  :pin melpa-stable)

;; scala-mode
(use-package scala-mode
  :interpreter
  ("scala" . scala-mode)
  :config
  (setq scala-indent:use-javadoc-style t))

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(load-theme 'misterioso t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (python-mode helm which-key magit evil-org evil-leader evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
