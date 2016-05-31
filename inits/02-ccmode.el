(require 'cc-mode)
 
;; c-mode-common-hook は C/C++ の設定
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-default-style "k&r") ;; カーニハン・リッチースタイル
            (setq c-basic-offset 4)      ;; indent は 4 スペース
            ))
