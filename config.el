;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Set packages archives
;; https://elpa.emacs-china.org/
(setq packages-archives
      '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
        ("org-cn"   . "http://elpa.emacs-china.org/org/")
        ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

;; Set default frame fullscreen
;; https://emacs.stackexchange.com/questions/2999/how-to-maximize-my-emacs-frame-on-start-up
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Fonts settings
;; https://github.com/hlissner/doom-emacs/wiki/Customization
;; (setq doom-font (font-spec :family "Fira Code" :size 14))
;; https://emacs-china.org/t/doom-emacs/6967
(setq
      doom-font (font-spec :family "DejaVu Sans Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans Mono")
      doom-unicode-font (font-spec :family "DejaVu Sans Mono")
      doom-big-font (font-spec :family "DejaVu Sans Mono" :size 16))

;; Set shell configuration
;; https://www.jianshu.com/p/4d81b7e32bff
;; set shell to bash for fcitx-remote
;; (setq shell-file-name "bash")

;; Configure fcitx
;; https://github.com/cute-jumper/fcitx.el
;; https://github.com/xcodebuild/fcitx-remote-for-osx
(fcitx-aggressive-setup)
;; Below command is wrong with fish, fcitx-remote in Mac, so comment
;; https://www.jianshu.com/p/4d81b7e32bff
;; (fcitx-prefix-keys-add "SPC")
;; (fcitx-prefix-keys-turn-on)

;; Org agenda settings
;; (setq org-agenda-files (list "~/MEGA/Org/gtd.org"
                             ;; "~/MEGA/Org/english.org"
                             ;; "~/MEGA/Tongji/Org/tongji.org"))
(setq org-agenda-files (list "~/MEGA/Tongji/Org/tongji.org"))

;; Dired mode settings
;; (put 'dired-find-alternate-file 'disabled nil)

;; Python Anancoda
;; https://github.com/hlissner/doom-emacs/issues/212
(setq python-shell-interpreter "/usr/local/anaconda3/bin/python"
      flycheck-python-pycompile-executable "/usr/local/anaconda3/bin/python")

;; Configure LaTeX
;; http://www.latexstudio.net/archives/51493.html
;; https://blog.csdn.net/bleedingfight/article/details/84946793
;; https://www.cnblogs.com/SunSmileCS/archive/2013/02/22/2923002.html
;; https://tex.stackexchange.com/questions/54739/reftex-wont-find-my-bib-file-in-local-library-tree
(add-hook 'LaTeX-mode-hook
      (lambda ()
            (add-to-list 'TeX-command-list
                  '("LatexMk" "latexmk %s" TeX-run-TeX nil t
                        :help "Run latexmk on file"))
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'xetex       ; use xelatex default
                  ;; TeX-show-compilation t    ;; display compilation windows
                  turn-on-auto-fill t)
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            ;; (setq reftex-default-bibliography '("~/MEGA/Tongji/Thesis/0_Dissertation/ref/ref.bib"))
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))
