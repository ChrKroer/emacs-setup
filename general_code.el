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




;; gdb-many-windows shortcuts for different buffers
(defun gdb-comint-buffer-name ()
  (buffer-name gud-comint-buffer))
(defun gdb-source-buffer-name ()
  (buffer-name (window-buffer gdb-source-window)))

(defun gdb-select-window (header)
  "Switch directly to the specified GDB window.
Moves the cursor to the requested window, switching between
`gdb-many-windows' \"tabs\" if necessary in order to get there.

Recognized window header names are: 'comint, 'locals, 'registers,
'stack, 'breakpoints, 'threads, and 'source."

  (interactive "Sheader: ")

  (let* ((header-alternate (case header
                             ('locals      'registers)
                             ('registers   'locals)
                             ('breakpoints 'threads)
                             ('threads     'breakpoints)))
         (buffer (intern (concat "gdb-" (symbol-name header) "-buffer")))
         (buffer-names (mapcar (lambda (header)
                                 (funcall (intern (concat "gdb-"
                                                          (symbol-name header)
                                                          "-buffer-name"))))
                               (if (null header-alternate)
                                   (list header)
                                 (list header header-alternate))))
         (window (if (eql header 'source)
                     gdb-source-window
                   (or (get-buffer-window (car buffer-names))
                       (when (not (null (cadr buffer-names)))
                         (get-buffer-window (cadr buffer-names)))))))

    (when (not (null window))
      (let ((was-dedicated (window-dedicated-p window)))
        (select-window window)
        (set-window-dedicated-p window nil)
        (when (member header '(locals registers breakpoints threads))
          (switch-to-buffer (gdb-get-buffer-create buffer))
          (setq header-line-format (gdb-set-header buffer)))
        (set-window-dedicated-p window was-dedicated))
      t)))

;; Use global keybindings for the window selection functions so that they
;; work from the source window too...
(mapcar (lambda (setting)
          (lexical-let ((key    (car setting))
                        (header (cdr setting)))
            (global-set-key (concat "\C-c\C-d" key) #'(lambda ()
                                                        (interactive)
                                                        (gdb-select-window header)))))
        '(("c" . comint)
          ("l" . locals)
          ("r" . registers)
          ("u" . source)
          ("s" . stack)
          ("b" . breakpoints)
          ("t" . threads)))
