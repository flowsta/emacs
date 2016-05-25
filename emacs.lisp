;; arranque

;; guardamos la sesión

(desktop-save-mode 1)

;; temas

(add-to-list 'custom-theme-load-path "~/ruta/tema")
(add-to-list 'custom-theme-load-path "~/ruta/otro/tema")
(load-theme 'zenburn t)

(add-to-list 'load-path "./emacs.d/elisp/")

;(add-hook 'text-mode-hook 'auto-fill-mode)

;; erc, chat, irc

(require 'erc)

(setq max-specpdl-size 1000)  ; default is 1000, reduce the backtrace level
(setq max-specpdl-size 32000) ; http://stackoverflow.com/questions/30736631/ess-produces-variable-binding-depth-exceeds-max-specpdl-size
(setq debug-on-error t)    ; now you should get a backtrace

;; LaTeX

(require 'ox-latex)
(add-to-list 'load-path "~/.emacs.d/elisp")
(load-library "latex-templates")
;; wrap código fuente
;(add-to-list 'org-latex-packages-alist '("" "minted"))
;(setq org-latex-listings 'minted)
;
;(setq org-latex-pdf-process
;     '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")

(setq org-export-latex-listings t)
(add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "color"))

;; melpa

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

;; xetex

;(setq-default TeX-engine 'xetex)

;; Babel

;; http://stackoverflow.com/questions/15773354/indent-code-in-org-babel-src-blocks
(setq org-src-tab-acts-natively t)

;; http://stackoverflow.com/questions/10642888/syntax-highlighting-within-begin-src-block-in-emacs-orgmode-not-working
(setq org-src-fontify-natively t)

;; esto lo tenía de antes
;;(require 'calfw)
(org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
        (R . t)
;	(grel . t)
	(sh . t)
	(python . t)
	(ruby . t)
	))

;; http://stackoverflow.com/questions/4711179/auto-expanding-blocks-of-comments-in-emacs

(defun refill-when-in-comment ()
  (interactive)
  (let ((curr-face (get-char-property (point) 'face)))
    (if (member "comment" (split-string (prin1-to-string curr-face) "-"))
        (fill-paragraph t)
      )
    )
  )

(defun smart-space (arg)
  (interactive "P")
  (refill-when-in-comment)
  (self-insert-command (prefix-numeric-value arg))
  )

(global-set-key " " 'smart-space)

;; Markdown

(eval-after-load "org"
  '(require 'ox-md nil t))

;; Reveal

(require 'ox-reveal)

(setq org-reveal-root "~/emacs.d/elisp/org-reveal")

;; Zotelo

(require 'zotelo)
(add-hook 'TeX-mode-hook 'zotelo-minor-mode)
;;
;; org-html5presentation
(add-to-list 'load-path "~/ruta/directorio/org-html5presentation.el/")
(require 'ox-html5presentation)
;;
;; sparql
;;
(add-to-list 'load-path "~/.emacs.d/elisp/sparql-mode/")
(autoload 'sparql-mode "sparql-mode.el"
    "Major mode for editing SPARQL files" t)
(add-to-list 'auto-mode-alist '("\\.sparql$" . sparql-mode))
(add-to-list 'auto-mode-alist '("\\.rq$" . sparql-mode))

;; elpy

(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)
(elpy-enable)

;; web-mode

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(max-specpdl-size 32000))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
