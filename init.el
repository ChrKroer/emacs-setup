

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))





;;(auto-fill-mode -1)
;;(remove-hook 'text-mode-hook #'turn-on-auto-fill)

;; code that enables modularization below
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))


;; load package stuff first, as it sets certain initializations needed for below .el files
(load-user-file "package.el")


(load-user-file "ui.el")
(load-user-file "tex.el")
;;(load-user-file "el-get.el")
(load-user-file "c-code.el")

