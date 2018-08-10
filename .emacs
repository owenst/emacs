;; Trevors .emacs file 2018-02-15

;; Notes:
;; Move:   C-f, C-b, C-a, C-e
;; Move:   M-f, M-b, M-a, M-e
;; Kill chain:   C-k, C-y, M-y	
;; Buffer Menu: C-x C-b: Dired like buffer menu
;;   use D to mark for deletion, S to mark for save, X to execute, Q to quit
;; Help: C-h: help. C-h a PATTERN: apropos search for PATTERN
;; Search under point: C-s . , C-r reverse search
;; Rectangle: C-x-SPACE select rectangle (rather than by line)
;; Indent: C-M-\
;;   C-x-SPACE to select rect then C-x-TAB (tab wth arrow keys or  < , >)
;;   M-i indent whitespace to tab stop
;; Repeat: C-u 4 : repeat the next command 4 times
;; Packages:
;;   M-x package-refresh-contents
;;   M-x package-install RET package_name RET
;; IMPORTANT PACKAGES:
;; IDO: Interactively do things
;;   Helps searching for files and through buffers (C-x C-f and C-x b)
;;   Use arrows and RET; C-d to go to dired menu in folder
;;   Use M-s to search or M-d to go to dired for menu
;; 
;; Emacs-Lisp
;;  Eval region: M-x eval-region
;;  Eval in mini-buffer M-:
;;  Eval at point C-x C-e

(require 'package) ;; You might already have this line
;;(add-to-list 'package-archives
;;	     '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize) ;; You might already have this line

;; ELPY
;(elpy-enable)

;;Use ido: interactively do things:
(require 'ido)
(ido-mode t)

;;Save state of emacs:
(desktop-save-mode 1)

;; initial frame size:
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 150))

;;Change meta key to super key (like windows key)
;;(setq x-super-keysym 'meta)

;; enable clipboard: may need CUA option in menu bar
;(setq x-select-enable-clipboard t)

;; Font size: Use M-x customize-face RET default or:
;;;;;;;(set-face-attribute 'default nil :height 200)

;; I hate tabs!
;; to setup tabs
(setq c-basic-indent 4)
(setq-default c-basic-offset 4)
(setq tab-width 4)
(setq indent-tabs-mode nil)

;;short yes and no
(fset 'yes-or-no-p 'y-or-n-p)
;;Add column numbers
(setq column-number-mode t)
;;Add line numbers
(setq line-number-mode t)
;;Disable upper and lower case region
(put 'upcase-region 'disabled t)
(put 'downcase-region 'disabled t)
;; erase the contents of a buffer
(put 'erase-buffer 'disabled nil)
;; Visual feedback on selections
(setq-default transient-mark-mode t)
;; Always end a file with a newline
(setq require-final-newline t)
;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)
;; Menubar / Toolbar on off:
(menu-bar-mode 1)
(tool-bar-mode 1)

;; Insertion of Dates.
(defun insert-date-string ()
  "Insert a nicely formated date string."
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))
;; C-c d calls insert-date-string
(global-set-key (kbd "C-c d") 'insert-date-string)

;; PYTHON
;; set pdb command to run:
(setq gud-pdb-command-name "python -m pdb")


;; ;; Autoindent from http://www.emacswiki.org/emacs/AutoIndentation
;; (dolist (command '(yank yank-pop))
;;    (eval `(defadvice ,command (after indent-region activate)
;;             (and (not current-prefix-arg)
;;                  (member major-mode '(emacs-lisp-mode lisp-mode
;;                                                       clojure-mode    scheme-mode
;;                                                       haskell-mode    ruby-mode
;;                                                       rspec-mode      python-mode
;;                                                       c-mode          c++-mode
;;                                                       objc-mode       latex-mode
;;                                                       plain-tex-mode))
;;                  (let ((mark-even-if-inactive transient-mark-mode))
;;                    (indent-region (region-beginning) (region-end) nil))))))
;; ;; ;; kill and join forward
;; (defun kill-and-join-forward (&optional arg)
;;   (interactive "P")
;;   (if (and (eolp) (not (bolp)))
;;       (progn (forward-char 1)
;;              (just-one-space 0)
;;              (backward-char 1)
;;              (kill-line arg))
;;     (kill-line arg)))






(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(flymake-start-syntax-check-on-newline nil)
 '(ido-enable-flex-matching t)
 '(package-selected-packages (quote (cmake-ide minimap go-mode elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "WhiteSmoke" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Menlo")))))
