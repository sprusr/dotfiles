;;; ENVIRONMENT

(eval-and-compile
  
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/") t)
  (package-initialize)

  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

  (add-to-list 'load-path "~/.emacs.d/lisp")

  (require 'use-package))

;;; PACKAGES

(use-package all-the-icons)

(use-package anaconda-mode
  :delight
  :hook (python-mode))

(use-package company
  :delight (company-mode)
  :config
  (global-company-mode 1))

(use-package company-go
  :hook (go-mode)
  :config
  (add-to-list 'company-backends 'company-go))

(use-package company-anaconda
  :ensure t
  :config
  (add-to-list 'company-backends 'company-anaconda))

(use-package company-tern
  :hook (js2-jsx-mode . tern-mode)
  :config
  (add-to-list 'company-backends 'company-tern))

(use-package counsel
  :delight (counsel-mode)
  :config (counsel-mode 1))

(use-package custom
  :custom
  (custom-file (expand-file-name "custom.el" user-emacs-directory) "Make custom add stuff to its own file.")
  :config
  (load custom-file 'noerror))

(use-package emacs
  :custom
  (debug-on-error t)
  (package-enable-at-startup nil)
  (mac-option-key-is-meta nil)
  (mac-command-key-is-meta t)
  (mac-command-modifier 'meta)
  (mac-option-modifier 'none)
  (ring-bell-function 'ignore)
  (backup-directory-alist `(("." . "~/.saves")))
  :config
  ;; default frame
  (add-to-list 'default-frame-alist '(width  . 120))
  (add-to-list 'default-frame-alist '(height . 60))
  (add-to-list 'default-frame-alist '(font . "Monospace-12"))
  ;; hide the GUI toolbar
  (tool-bar-mode -1)
  (toggle-scroll-bar -1)
  ;; material theme
  (load-theme 'material-light t))

(use-package gnutls
  :config
  (add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem"))

(use-package go-mode
  :mode "\\.go\\'")

(use-package ivy
  :delight (ivy-mode)
  :config (ivy-mode 1))

(use-package js2-mode
  :mode ("\\.m?jsx?\\'" . js2-jsx-mode)
  :interpreter ("node" . js2-jsx-mode)
  :custom
  (js2-mode-show-strict-warnings nil "Disable strict JS warnings.")
  (js2-basic-offset 2))

(use-package js2-refactor
  :hook (js2-jsx-mode . js2-refactor-mode)
  :bind (:map js2-refactor-mode-map ; TODO: bindings don't work
	      ("C-c C-r ef" . js2r-extract-function)
	      ("C-c C-r rv" . rename-var)))

(use-package minimap
  :demand
  :delight (minimap-mode)
  :bind ("C-c n" . minimap-mode)
  :custom
  (minimap-major-modes '(prog-mode text-mode))
  (minimap-window-location 'right)
  :config
  (minimap-mode 1))

(use-package neotree
  :after (all-the-icons)
  :bind (("C-c t" . neotree-toggle))
  :custom
  (neo-theme (if (display-graphic-p) 'icons 'arrow) "Use arrows for neotree."))

(use-package which-key
  :delight (which-key-mode)
  :config
  (which-key-mode 1))
