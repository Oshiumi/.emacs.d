;; Cask(Mac)
(require 'cask )
(cask-initialize)

(require 'init-loader)
;;(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")


(require 'pallet)
(pallet-mode t)

(global-linum-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
