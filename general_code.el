(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;(setq company-backends (delete 'company-semantic company-backends))
(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

 ;; use gdb-many-windows by default
(setq gdb-many-windows t)
 ;; Non-nil means display source file containing the main routine at startup
(setq gdb-inferior-io-mode nil)

;; Adds the OSX bin folder for GDB to PATH. Ensure that GDB is relatively new. The HomeBrew version is adequate.
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

