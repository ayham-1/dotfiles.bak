(require 'use-package-ensure)
(setq use-package-always-ensure t)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-window-scroll-bars (minibuffer-window) nil nil)

(setq frame-title-format '((:eval (projectile-project-name))))

(defun apply-theme ()
      "Make frames just slightly transparent."
      (interactive)
(load-theme 'monokai t))

(use-package monokai-theme
      :config
      (apply-theme))
(setq ;; foreground and background
	      monokai-foreground     "#ABB2BF"
	      monokai-background     "#282C34"
	      ;; highlights and comments
	      monokai-comments       "#F8F8F0"
	      monokai-emphasis       "#282C34"
	      monokai-highlight      "#FFB269"
	      monokai-highlight-alt  "#1B1D1E"
	      monokai-highlight-line "#1B1D1E"
	      monokai-line-number    "#F8F8F0"
	      ;; colours
	      monokai-blue           "#61AFEF"
	      monokai-cyan           "#56B6C2"
	      monokai-green          "#98C379"
	      monokai-gray           "#3E4451"
	      monokai-violet         "#C678DD"
	      monokai-red            "#E06C75"
	      monokai-orange         "#D19A66"
	      monokai-yellow         "#E5C07B")
(setq monokai-height-minus-1 0.8
	      monokai-height-plus-1 1.1
	      monokai-height-plus-2 1.15
	      monokai-height-plus-3 1.2
	      monokai-height-plus-4 1.3)

(use-package powerline)
(powerline-default-theme)

(setq org-ellipsis "↲")

(setq gc-cons-threshold 20000000)

(add-hook 'prog-mode-hook 'subword-mode)

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(add-hook 'before-save-hook
		      (lambda ()
			(when buffer-file-name
			      (let ((dir (file-name-directory buffer-file-name)))
				(when (and (not (file-exists-p dir)) y-or-n-p (format "Directory %s does not exist, Create it?" dir))
				      (make-directory dir t ))))))

(setq require-final-newline t)

(setq-default dired-listing-switches "-alh")

(global-auto-revert-mode t)

(setq mouse-yank-at-point 1)

(global-set-key  (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(show-paren-mode 1)

(global-display-line-numbers-mode)

(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*", temporary-file-directory t)))

(use-package key-chord)

(use-package evil)
(evil-mode t)
;;Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)

(use-package ag)

(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

(global-set-key (kbd "M-/") 'company-complete-common)

(use-package flycheck)

(use-package magit
      :bind ("C-x g" . magit-status))

(use-package projectile)

(use-package undo-tree)

(use-package paredit)

(use-package rainbow-delimiters)

(setq-default tab-width 4)

(use-package subword
      :config (global-subword-mode 1))

(setq-default c-basic-offset 4)

(setq lispy-mode-hooks
	      '(emacs-lisp-hook lisp-mode-hook))

(dolist (hook lispy-mode-hooks)
      (add-hook hook (lambda()
				       (setq show-paren-style 'expression)
(paredit-mode)
(rainbow-delimeters-mode))))

(setq org-src-tab-acts-natively t)

(add-hook 'sh-mode-hook
		      (lambda ()
			(setq sh-basic-offset 4
				      sh-indentation 4)))
