(setq c-default-style "linux"
          c-basic-offset 4)

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;(add-to-list 'load-path "/Users/ckroer/.emacs.d/")
;(require 'julia-mode)

(tool-bar-mode 0)
;(tabbar-mode 0)
;(c-set-offset 'innamespace 0)

(setq py-split-windows-on-execute-p nil)

(auto-fill-mode -1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook '(flyspell-mode t))


(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(load-theme 'tango-dark t)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
