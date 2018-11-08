;; Trevors .emacs file 2018-10-02

;; Notes:
;; Change Font Size: C-x C-+/C--
;; Move:   C-f, C-b, C-a, C-e
;;         M-f, M-b, M-a, M-e
;; Kill chain:   C-k, C-y, M-y
;; Undo: C-/ or C-x u
;; GoTo Line: M-g M-g LIN
;; Repeat: C-u 4 : repeat the next command 4 timse
;; Comment M-; (on selected region)

;; Indent:
;;   C-x-TAB (tab wth arrow keys or  < , >);
;;   C-M-\  indent region
;;   M-i indent whitespace to tab stop
;;   Rectangle: C-x-SPACE select rectangle (rather than by line)
;; Justify: M-x-fill-paragraph OR M-q
;;   Set margin with C-x f NUMBER

;; Searching
;;   Find and Replace: M-$
;;   Search under point: C-s C-w, C-s . , C-r reverse search

;; Buffer Menu: C-x C-b: Dired like buffer menu
;;   use D to mark for deletion, S to mark for save, X to execute, Q to quit

;; Help:
;;    C-h ?
;;    C-h: help. C-h a PATTERN: apropos search for PATTERN
;;    C-h k KEYSTROKE: describes keystroke
;;    C-h m  :  help on current mode
;;    View faces under point: C-u C-x =


;; Files
;;   Save modified: C-x-s
;;   Autosave: #filename. Recover: M-x recover-file
;;   Revert Buffer when changed elsewhere: M-x revert-buffer 

;; Windows
;;   Switch: C-x-o
;;   Split Vertical C-x-3
;;   Split Horizontal C-x-2
;;   Remove New Window C-x-0

;; Packages:
;;   M-x package-refresh-contents
;;   M-x package-install RET package_name RET
;; IMPORTANT PACKAGES:
;; IDO: Interactively do things
;;   Helps searching for files and through buffers (C-x C-f and C-x b)
;;   Use arrows and RET; C-d to go to dired menu in folder
;;   Use M-s to search or M-d to go to dired for menu
;; Multiple-cursors: see below for commands

;; Emacs-Lisp
;;  Eval region: M-x eval-region
;;  Eval in mini-buffer M-:
;;  Eval at point C-x C-e

(require 'package) 

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                      ("marmalade" . "http://marmalade-repo.org/packages/")
;;                      )
;;       )

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
             '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize) ;; You might already have this line

;; ------------------------------------------------------ ;;
;;      Remove package signature check to prevent hang
(setq package-check-signature nil)
;; ------------------------------------------------------ ;;


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

;; ELPY
(use-package elpy
  :config
  (elpy-enable)
  )

;;Use ido: interactively do things:
(use-package ido
  :config
  (ido-mode t)
  )

;;Save state of emacs:
(desktop-save-mode 1)

;; initial frame size:
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 150))

;; CMAKE-IDE
;; (require 'rtags) ;; optional, must have rtags installed
;; (cmake-ide-setup)
;; (setq cmake-ide-flags-c++
;;      "/usr/include/c++/5:/usr/include/x86_64-linux-gnu/c++/5:/usr/include/c++/5/backward:/usr/lib/gcc/x86_64-linux-gnu/5/include:/usr/local/include:/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed:/usr/include/x86_64-linux-gnu:/usr/include")
;; (setq cmake-ide-build-dir "~/radar/")

;; Multiple cursors
;; NOTE: To get out of multiple-cursors-mode, press <return> or C-g. The latter will first disable multiple regions before disabling multiple cursors. If you want to insert a newline in multiple-cursors-mode, use C-j
(use-package multiple-cursors
	     :config
	     (define-key mc/keymap (kbd "<return>") nil)
	     ;; Exit multiple-cursors Ctrl-g
	     (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
	     (global-set-key (kbd "C->") 'mc/mark-next-like-this)
	     (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
	     (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
	     (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
	     )

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


;; C/C++   --   CC-Mode
(setq c-default-style '((java-mode . "java")
			(awk-mode . "awk")
			(other . "stroustrup")))


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


;; Emacs Customization - mine:


;;Change meta key to super key (like windows key)
;;(setq x-super-keysym 'meta)
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





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(flymake-start-syntax-check-on-newline nil)
 '(ido-enable-flex-matching t)
 '(menu-bar-mode 1)
 '(package-selected-packages (quote (multiple-cursors cmake-ide minimap go-mode elpy)))
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(tool-bar-mode -1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
