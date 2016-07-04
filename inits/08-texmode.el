;;
;; PATH
;;
(setenv "PATH"
        (concat (getenv "PATH") ":/Library/TeX/texbin"))
;;
;; TeX mode
;;
(setq auto-mode-alist
      (append '(("\\.tex$" . latex-mode)) auto-mode-alist))
(setq tex-default-mode 'latex-mode)
(setq tex-start-commands "\\nonstopmode\\input")
(setq tex-run-command "/Library/TeX/texbin/ptex2pdf -u -e -ot '-synctex=1 -interaction=nonstopmode'")
;(setq tex-run-command "/Library/TeX/texbin/luatex -synctex=1 -interaction=nonstopmode")
;(setq tex-run-command "/Library/TeX/texbin/luajittex -synctex=1 -interaction=nonstopmode")
;(setq tex-run-command "/Library/TeX/texbin/xetex -synctex=1 -interaction=nonstopmode")
;(setq tex-run-command "/Library/TeX/texbin/pdftex -synctex=1 -interaction=nonstopmode")
(setq latex-run-command "/Library/TeX/texbin/ptex2pdf -u -l -ot '-synctex=1 -interaction=nonstopmode'")
;(setq latex-run-command "/Library/TeX/texbin/lualatex -synctex=1 -interaction=nonstopmode")
;(setq latex-run-command "/Library/TeX/texbin/luajitlatex -synctex=1 -interaction=nonstopmode")
;(setq latex-run-command "/Library/TeX/texbin/xelatex -synctex=1 -interaction=nonstopmode")
;(setq latex-run-command "/Library/TeX/texbin/pdflatex -synctex=1 -interaction=nonstopmode")
(setq tex-bibtex-command "/Library/TeX/texbin/latexmk -e '$latex=q/uplatex %O -synctex=1 -interaction=nonstopmode %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
(require 'tex-mode)
(defun tex-view ()
  (interactive)
  (tex-send-command "/usr/bin/open -a preview.app" (tex-append tex-print-file ".pdf")))
(defun tex-print (&optional alt)
  (interactive "P")
  (if (tex-shell-running)
      (tex-kill-job)
    (tex-start-shell))
  (tex-send-command "/usr/bin/open -a preview.app" (tex-append tex-print-file ".pdf")))
(setq tex-compile-commands
      '(("/Library/TeX/texbin/ptex2pdf -u -l -ot '-synctex=1 -interaction=nonstopmode' %f" "%f" "%r.pdf")
        ("/Library/TeX/texbin/uplatex -synctex=1 -interaction=nonstopmode %f && /Library/TeX/texbin/dvips -Ppdf -z -f %r.dvi | /Library/TeX/texbin/convbkmk -u > %r.ps && /usr/local/bin/ps2pdf %r.ps" "%f" "%r.pdf")
        ("/Library/TeX/texbin/pdflatex -synctex=1 -interaction=nonstopmode %f" "%f" "%r.pdf")
        ("/Library/TeX/texbin/lualatex -synctex=1 -interaction=nonstopmode %f" "%f" "%r.pdf")
        ("/Library/TeX/texbin/luajitlatex -synctex=1 -interaction=nonstopmode %f" "%f" "%r.pdf")
        ("/Library/TeX/texbin/xelatex -synctex=1 -interaction=nonstopmode %f" "%f" "%r.pdf")
        ("/Library/TeX/texbin/latexmk %f" "%f" "%r.pdf")
        ("/Library/TeX/texbin/latexmk -e '$latex=q/uplatex %%O -synctex=1 -interaction=nonstopmode %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -e '$dvipdf=q/dvipdfmx %%O -o %%D %%S/' -norc -gg -pdfdvi %f" "%f" "%r.pdf")
        ("/Library/TeX/texbin/latexmk -e '$latex=q/uplatex %%O -synctex=1 -interaction=nonstopmode %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -e '$dvips=q/dvips %%O -z -f %%S | convbkmk -u > %%D/' -e '$ps2pdf=q/ps2pdf %%O %%S %%D/' -norc -gg -pdfps %f" "%f" "%r.pdf")
        ("/Library/TeX/texbin/latexmk -e '$pdflatex=q/pdflatex %%O -synctex=1 -interaction=nonstopmode %%S/' -e '$bibtex=q/bibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/makeindex %%O -o %%D %%S/' -norc -gg -pdf %f" "%f" "%r.pdf")
        ("/Library/TeX/texbin/latexmk -e '$pdflatex=q/lualatex %%O -synctex=1 -interaction=nonstopmode %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -norc -gg -pdf %f" "%f" "%r.pdf")
        ("/Library/TeX/texbin/latexmk -e '$pdflatex=q/luajitlatex %%O -synctex=1 -interaction=nonstopmode %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -norc -gg -pdf %f" "%f" "%r.pdf")
        ("/Library/TeX/texbin/latexmk -e '$pdflatex=q/xelatex %%O -synctex=1 -interaction=nonstopmode %%S/' -e '$bibtex=q/upbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -norc -gg -pdf %f" "%f" "%r.pdf")
        ((concat "\\doc-view" " \"" (car (split-string (format "%s" (tex-main-file)) "\\.")) ".pdf\"") "%r.pdf")
        ("/usr/bin/open -a Skim.app %r.pdf" "%r.pdf")
        ("/usr/bin/open -a Preview.app %r.pdf" "%r.pdf")
        ("/usr/bin/open -a TeXShop.app %r.pdf" "%r.pdf")
        ("/Applications/TeXworks.app/Contents/MacOS/TeXworks %r.pdf" "%r.pdf")
        ("/Applications/texstudio.app/Contents/MacOS/texstudio --pdf-viewer-only %r.pdf" "%r.pdf")
        ("/usr/bin/open -a Firefox.app %r.pdf" "%r.pdf")
        ("/usr/bin/open -a \"Adobe Reader.app\" %r.pdf" "%r.pdf")))
(defun skim-forward-search ()
  (interactive)
  (let* ((ctf (buffer-name))
         (mtf (tex-main-file))
         (pf (concat (car (split-string mtf "\\.")) ".pdf"))
         (ln (format "%d" (line-number-at-pos)))
         (cmd "/Applications/Skim.app/Contents/SharedSupport/displayline")
         (args (concat ln " " pf " " ctf)))
    (message (concat cmd " " args))
    (process-kill-without-query
     (start-process-shell-command "displayline" nil cmd args))))
(add-hook 'latex-mode-hook
          '(lambda ()
             (define-key latex-mode-map (kbd "C-c s") 'skim-forward-search)))
;;
;; RefTeX with TeX mode
;;
(add-hook 'latex-mode-hook 'turn-on-reftex)
