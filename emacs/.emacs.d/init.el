;; Configure package.el to include MELPA.
(require 'package)
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; Ensure that use-package is installed.
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
  (require 'use-package)

;; Fix st support.
(add-to-list 'term-file-aliases
    '("st-256color" . "xterm-256color"))

(org-babel-load-file (concat user-emacs-directory "config.org"))
