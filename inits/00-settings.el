; テーマ色設定
;; (load-theme 'desert t t)
;; (enable-theme 'desert)
;; (load-theme 'dark-laptop t t)
;; (enable-theme 'dark-laptop)
(load-theme 'railscast t t)
(enable-theme 'railscast)

; 行番号
(global-linum-mode t)

; メニューバー非表示
(tool-bar-mode -1)

; かっこのハイライト
(show-paren-mode t)

; かっこの自動挿入
(electric-pair-mode 1)

;; ウインドウの透明度
(add-to-list 'default-frame-alist '(alpha . 95))
;; カレントウインドウの透明度
(set-frame-parameter nil 'alpha 0.95)

;; タブ幅
(defun set-aurora-tab-width (num &optional local redraw)
  "タブ幅をセットします。タブ5とかタブ20も設定できたりします。
localが non-nilの場合は、カレントバッファでのみ有効になります。
redrawが non-nilの場合は、Windowを再描画します。"
  (interactive "nTab Width: ")
  (when local
    (make-local-variable 'tab-width)
    (make-local-variable 'tab-stop-list))
  (setq tab-width num)
  (setq tab-stop-list ())
  (while (<= num 256)
    (setq tab-stop-list `(,@tab-stop-list ,num))
    (setq num (+ num tab-width)))
  (when redraw (redraw-display)) tab-width)

(set-aurora-tab-width (setq default-tab-width (setq-default tab-width 4)))

;; タブ設定
(c-set-offset 'statement-case-intro '+)
(c-set-offset 'statement-case-open '+)
