(require 'cc-mode)

(setq c-default-style "linux"
          c-basic-offset 2)


(semantic-mode 1)

;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

;; (add-to-list 'company-backends 'company-c-headers)

;; (add-hook 'c-mode-common-hook 
;;           (lambda () (define-key c-mode-base-map (kbd "C-c C-l") 'recompile)))
