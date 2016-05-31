; テーマ色設定
;; (color-theme-initialize)
;; (color-theme-ld-dark)
(load-theme 'wombat)

; 行番号
(global-linum-mode t)

; メニューバー非表示
(tool-bar-mode -1)

; かっこのハイライト
(show-paren-mode t)

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
