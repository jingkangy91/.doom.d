;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Set packages archives
(setq packages-archives
      '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
        ("org-cn"   . "http://elpa.emacs-china.org/org/")
        ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

;; Set default frame fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Fonts settings
;; (setq doom-font (font-spec :family "Fira Code" :size 14))
(setq
      doom-font (font-spec :family "DejaVu Sans Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans Mono")
      doom-unicode-font (font-spec :family "DejaVu Sans Mono")
      doom-big-font (font-spec :family "DejaVu Sans Mono" :size 16))

;; Configure fcitx
(fcitx-aggressive-setup)

;; Python Anancoda
(setq python-shell-interpreter "~/.local/anaconda3/bin/python"
      flycheck-python-pycompile-executable "~/.local/anaconda3/bin/python")

;; Configure LaTeX
(add-hook 'LaTeX-mode-hook
      (lambda ()
        (add-to-list 'TeX-command-list
                     '("LatexMk" "latexmk %s" TeX-run-TeX nil t
                       :help "Run latexmk on file"))
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'xetex       ; use xelatex default
                  ;; TeX-show-compilation t    ;; display compilation windows
                  turn-on-auto-fill t
            )
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))
