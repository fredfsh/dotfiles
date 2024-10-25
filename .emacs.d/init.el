;;; GLOBAL ;;;

;; erldventofcode
(load "~/erldventofcode/aoc.el")
;; disable backup files
(setq make-backup-files nil)
;; remove trailing whitespace
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
;; line / column number
(global-display-line-numbers-mode)
(setq column-number-indicator-zero-based nil)
(setq column-number-mode t)
;; no tabs
(setq-default indent-tabs-mode nil)
;; save place
(save-place-mode 1)
;; no menu bar
(menu-bar-mode -1)
;; melpa
(require 'package)
(add-to-list 'package-archives '("MELPA" . "https://melpa.org/packages/") t)
;; color theme
(load-theme 'zenburn t)
;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; LSP ;;;
(setq lsp-keymap-prefix "M-p")
(require 'lsp-mode)
(setq lsp-lens-enable nil)
;; Erlang
(add-hook 'erlang-mode-hook #'lsp-deferred)
(add-hook 'erlang-mode-hook '(lambda()
                               (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))
;; C/C++
(add-hook 'c-mode-hook #'lsp-deferred)
(add-hook 'c++-mode-hook #'lsp-deferred)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(erlang flycheck zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
