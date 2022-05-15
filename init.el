;; Trevors .emacs file 2021-06-09
;; MacOS: $ brew install homebrew/cask/emacs
;; Refresh / Reload / Source current file after change: M-x load-file <ENTER>
;; UPDATE Packages: M-x packg-list-pkgs, u to Update, ~ to Delete obsolete, x to eXecute
;;  THEN RECOMPILE .elc M-: (byte-recompile-directory package-user-dir nil 'force)


;; TODO:
;; 1) Disable multiple completions at point in Elpy
;; 2)
;; 3) Remove parsing - set (global-semantic-idle-scheduler-mode nil)

;; ERRORS: (and fixes)
;; - C-; runs the command iedit-toggle-selection (found in ‘iedit.el’)
;;  - Use C-; to exit iedit-mode
;; - Failed to initialize color list unarchiver: Error Domain=NSCocoaErrorDomain Code=4864
;;    Solution: delete ~/Library/Colors/Emacs.clr and restart
;;    Better: add (delete-file "~/Library/Colors/Emacs.clr") to end of this file

;; Notes:
;; Change Font Size: C-x C-+/C--
;; Move:   C-f, C-b, C-a, C-e
;;         M-f, M-b, M-a, M-e
;;         C-M-n C-M-p by s-exp or balanced expression
;;         C-M-v scroll other buffer
;;         M-m move to beginning of indented region
;; Kill chain:   C-k, C-y, M-y
;; Undo: C-/ or C-_ or C-x u
;;   ** Note: terminal in macOS is VT100 and so can't send C-/
;;    C-x u: Undo-Tree visualization: undo-tree.el https://www.dr-qubit.org/undo-tree/undo-tree.txt
;;    q : quit undo tree
;;    t : time stamps
;;    d : toggle diff
;;
;;
;;
;;
;; GoTo Line: M-g g LINE or M-g M-g LINE
;;      Char M-x goto-char
;; Repeat:
;;   C-u 4 : repeat the next command 4 times
;;   ESC-4 : repeat the next command 4 times
;; Comment M-; (on selected region)

;; NEW TO LEARN:
;; imenu helm-imenu: to see list of functions in current buffer
;; setup-editing.el
;;   M-o insert line
;;   C-c i indent region - NOT WORKING
;; Dynamic completion: M-/ - currently comment




;; Marks, Points
;;  M-h : mark paragraph from point, use consecutively to extend
;;  C-SPC set mark
;;  C-SPC C-SPC set mark but deactivate region
;;  C-u C-SPC pop mark
;;  C-x C-x toggle between point and mark
;;  M-r jump point around without scrolling
;;   Registers:
;;     C-x r SPC : save location to register
;;     C-x r j   : jump to register location
;;   Bookmarks : save between sessions
;;     C-x r m  : make
;;     C-x r b  : back to bookmark
;;     C-x r l  : list bookmarks

;; Indent:
;;   C-x-TAB (tab wth arrow keys or  < , >);
;;   C-M-\  indent region
;;   M-i indent whitespace to tab stop
;;   Rectangle: C-x-SPACE select rectangle (rather than by line)
;; Justify: M-x-fill-paragraph OR M-q
;;   Set margin with C-x f NUMBER
;; Whitespace: M-x fixup-whitespace
;;   Removes excess whitespace from end of line

;; Keyboard Macros:
;;   Define (record): C-x (
;;     Do Stuff
;;   End:    C-x )
;;   Run Macro: C-x e
;;   Now use ESC-500 + CMD to repeat 500 times (or M-u 500)

;; -------  Searching  --------
;;   Find and Replace: M-%, or C-M-% for regexp search with setup-editing.el
;;     Then y: replace, n: no, q: exit, !:replace all
;;   Search under point: C-s C-w, C-s . , C-r reverse search
;;     C-s M-n [M-p] Use next or previous search in search history
;;     C-s C-s Repeat search
;;     M-i to hand this over to swoop
;;  DIRED - Searching Directories: C-x d OR M-x dired
;;   + add dir
;;   d mark for deletion
;;   x execute
;;   ? help
;;  NEOTREE - Directory Tree: https://github.com/jaypei/emacs-neotree
;;    n next line ， p previous line。
;;    RET - open
;;    U Go up a directory
;;    g Refresh
;;    A Maximize/Minimize the NeoTree Window
;;    H Toggle display hidden files
;;    C-c C-n Create a file or create a directory if filename ends with a ‘/’
;;    C-c C-d Delete a file or a directory.
;;    C-c C-r Rename a file or a directory.
;;    C-c C-c Change the root directory.
;;    C-c C-p Copy a file or a directory.
;;    M-x neotree-dir - show NeoTree window and specify a directory as its root
;;    M0x neotree-toggle
;;  SWOOP - https://github.com/emacsorphanage/helm-swoop
;;  Swoop search C-c s
;;   C-c s (swoop) interactively search from point and display search in other buffer!!!!
;;     C-c C-e : enter the edit mode. Before enter the edit mode, you can choose
;;       some lines marked by C-SPC or M-SPC to edit.
;;       C-x C-s: Apply changes to original buffer type.
;;  Helm and related :
;;   C-c d  : delete buffer
;;   C-S-o   : toggle btwn .hpp and .cpp : helm-projectile-find-other-file
;;     C-o : switch between sources when in helm, or set helm-move-to-line-cycle-in-source to nil
;;     M-i to interactively change the buffer (from isearch to swoop or during helm)
;;   M-., M-, go to def and pop


;; Find on command line:
;;  $ find . -name "filename" -print

;; Buffer swap:
;;   M-x buf-move then arrows
;;   M-x buf-move-left / right / up / down

;; Grep:
;;   M-X grep. Can use as rgrep to search recursively (with -r option)
;;       -> customize 'grep' "C-h-f grep" and add -r or just use rgrep
;;   Use like: grep -nH --null -r -e 'foo' .
;;     searches for foo recursively starting at this directory
;;   -n : line numbers
;;   -H : file name headers
;;   --null : zero byte after filename
;;   -r recursively
;;   -e expression
;;  Can use prefix C-u to prefix grep
;;  Compilation mode to move around
;;    M-g n / p OR C-x ` or M-x next-error or RET in grep buffer
;;  See also: rgrep for separate prompts

;; Buffer Menu:
;;   WITH HELM: M-x list-buffers
;;     C-c d: delete buffer
;;   NO HELM: C-x C-b: Dired like buffer menu
;;   Press:
;;     d to mark for deletion,
;;     s to mark for save,
;;     x to execute,
;;     q to quit
;;   C-x k to kill current buffer (removes)
;; Dired: C-x d : To see directory and navigate

;; Help:
;;    C-h ?
;;    C-h C-h help with function, like iSearch
;;    C-h: help.
;;    C-h a PATTERN: apropos search for PATTERN
;;    C-h k KEYSTROKE: describes keystroke
;;    C-h m  :  help on current mode
;;    View faces under point: C-u C-x =
;;    Describe Variable: C-h v
;;      C-h v load-path : view info on load path
;; Customization:
;; Easy Customization:
;; M-x customize-option


;; Files
;;   Save modified: C-x-s
;;   Autosave: #filename. Recover: M-x recover-file
;;  Reread from source:
;;   Revert Buffer when changed elsewhere: M-x revert-buffer (reload)
;;   Global Auto M-x global-auto-revert-buffer
;;   C-x C-r : find recent (uses recentf)
;; Remote files: https://www.gnu.org/software/emacs/manual/html_node/emacs/Remote-Files.html
;;   /ftp.:user@host#port:/path/to/filename
;;   can also use ssh or scp to access remote file

;; Windows / Buffer
;;   Switch: C-x-o
;;   Split Vertical C-x-3
;;   Split Horizontal C-x-2
;;   Remove New Window C-x-0
;;   Toggle single window C-x-1 : from zygospore!!!

;; Packages:
;;   M-x package-refresh-contents
;;   M-x package-install RET package_name RET
;;   C-h v load-path if not finding a package


;; -----------------------------------------------------------------;;
;; ------------------   IMPORTANT PACKAGES:   ----------------------;;
;; -----------------------------------------------------------------;;

;; GDB:
;; Setup: (need -g flag)
;;   cat hello.c
;;   gcc -g hello.c -o output_file_name
;; Commands:
;;   M-x gdb
;;     Run like: gdb -i=mi a.out  (-i=mi is for many windows);;
;;   start: goes through main
;;   run input_args   : runs until
;;   list shows position
;;   q: quits
;;   d : disable breakpoint
;;   c: continue
;;   disp y : shows y value
;;   C-c C-c to quit
;;   b 43 : sets breakpoint at line 43
;;   b 28 if value==19  : breaks only if condition is met

;; IDO: Interactively do things
;;   Helps searching for files and through buffers (C-x C-f and C-x b)
;;     C-f to stop flex searching for files
;;   Use arrows and RET; C-d to go to dired menu in folder
;;   Use M-s to search or M-d to go to dired for menu
;;
;;   Now uses flx-ido to create fuzzy matching

;; Multiple-cursors: see below for commands (multicursors)
;;   C-> to get new cursor
;;   C-g to quit

;; use-package: only load package if already installed
;;   https://github.com/jwiegley/use-package
;;   :init   set variables before loading (setq variable nil)
;;   :config   set after loading (change a mode)
;;   :bind ("C-." . ace-jump-mode)

;; recentf: load recently used files
;;   C-x C-r : defined below to use IDO style file searching - WORKS!

;; Emacs-Lisp
;;  Eval region: M-x eval-region
;;  Eval in mini-buffer M-: // deprecated
;;  Eval at point C-x C-e

;; Modes
;;  M-x [global-]linum-mode : add line numbers [globally]
;;  M-x c++-mode

;; Terminal / Shell
;;   M-x term
;;   M-x ansi-term
;; Web browser
;;   M-x eww
;;     l - back


;; Zygospore
;;   Toggle C-x-1 : window open close

;; helm
;;   C-M-a, C-M-e : beginning and end of defun
;;   C-M-a   : mark defun
;;   C-M-SPC : mark sexp
;;   C-M-f, C-M-b : forward, back sexp
;;   C-M-k        : kill sexp
;;   C-c h : helm prefix
;;   C-c h g : Google Search
;;
;; helm-gtags
;;   setup gtags - install gnu global as parser: https://www.gnu.org/software/global/global.html
;;     mac - brew install global, linux - apt install global???
;;     cd to project directory base: $ gtags
;;   M-. , M-,  : jump to definition, pop definition
;;
;; helm-swoop
;;   C-c s interactively search from point and display search in other buffer!!!!
;;   M-i to interactively change the buffer ??? already tab stop indent
;;
;; helm-projectile
;;   toggle between files with same names but different extensions (e.g. .h <-> .c/.cpp
;;   replace in project
;;   multi-occur in project buffers
;;   grep in project
;;   C-c p h : M-x helm-projectile-find-file
;;   C-S-o   : toggle btwn .hpp and .cpp : helm-projectile-find-other-file


;; setup-CEDET.el
;;   Semantic:
;;     C-c C-j : semantic jump to
;;     C-c C-s : semantic show summary
;;   EDE
;;   Speedbar:
;;     sr-speedbar-toggle : open mini window browser


;; Company
;;   Can use many different backends. The most basic is to use semantic which is portable and is a parser written in emacs.
;;   We are using semantic
;;   Want to also use gtags
;; Here is a great example using irony with clang and gtags:
;;   http://www.cachestocaches.com/2015/8/c-completion-emacs/
;;   NEED TO CHECK COMPATIBILITY WITH SEMANTIC (with company)

;; Yasnippet
;; M-x yas-describe-tables : shows available snippets for current mode

;; OTHER UNUSED PACKAGES
;; CSCOPE instead of GNU Global
;; rtags
;; flycheck
;; auto-complete-clang
;; Irony
;; Company-Irony


;; -----------------------------------------------------------------;;
;; -------------------------   END   -------------------------------;;
;; -----------------------------------------------------------------;;




;; -----------------------------------------------------------------;;
;; -----------------------------------------------------------------;;
;; ---------------------   EMACS SETUP   ---------------------------;;
;; -----------------------------------------------------------------;;
;; -----------------------------------------------------------------;;

;;The value is in 1/10pt, so 100 will give you 10pt, etc.
(set-face-attribute 'default nil :height 130)

;;Save state of emacs:
(desktop-save-mode 1)

;; initial frame size:
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 150))

;; use space to indent by default
(setq-default indent-tabs-mode nil)
;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Need to rebind tab-to-tab-stop
;;(global-set-key (kbd "C-t") 'tab-to-tab-stop)

;; Stop the fucking dinging
(setq visible-bell t)
(setq ring-bell-function 'ignore)


;; Garbage collection default 800kb
;;   If you notice freezing: http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)


;; -------------------   setup-general.el  ------------------------------------------
;; Compilation - set to call compile automatically
;; To reset command: C-h v compile-command and apply for session
;; C-h f "compile" to see help
;; Use menu Tools->Compile to set compile command
(global-set-key (kbd "C-c c") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))


;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t
 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; -----------------------------------------------------------------------------------
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


;; EXCHANGE POINT AND MARK
;; This defines C-x C-x to not activate region when exchanging the
;; point and mark So you can use C-SPC C-SPC to set mark deactivate
;; region and then move around then jump back without selecting a
;; region
;; https://masteringemacs.org/article/fixing-mark-commands-transient-mark-mode
(defun exchange-point-and-mark-no-activate ()
  "Identical to \\[exchange-point-and-mark] but will not activate the region."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))
(define-key global-map [remap exchange-point-and-mark] 'exchange-point-and-mark-no-activate)


;;Change meta key to super key (like windows key)
;;(setq x-super-keysym 'meta)


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




;; -----------------------------------------------------------------;;
;; -----------------------   PACKAGES   ----------------------------;;
;; -----------------------------------------------------------------;;


(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize) ;; You might already have this line
(when (not package-archive-contents)
  (package-refresh-contents))

;;      Remove package signature check to prevent hang
(setq package-check-signature nil)


;; Bootstrap `use-package'
;; https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;-----------------------------
;; Print stack trace on error
;; (setq debug-on-error t)
;;-----------------------------

;; NeoTree
(use-package neotree
  :ensure t
  )

;; CMake-Mode
(use-package cmake-mode
  :ensure t
  )
(use-package cmake-font-lock
  :init
  (autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
  (add-hook 'cmake-mode-hook 'cmake-font-lock-activate)
  :ensure t
  )

;; ELPY
;;   Evaluate
;;     C-RET: Evaluate line and nested lines
;;     Run in buffer: C-c C-c  (Prefix with C-u to include main) - This is a feature
;;     eval  C-c C-y e, b(buffer)
;;   Python Shell     C-c C-z
;;     - previous M-p
;;   Find
;;     file in project C-c C-f
;;     symbom in project C-c C-s
;;   Completion M-TAB
;;   GoTo
;;     Def     M-.
;;     PopDef  M-*
;;     Def in other window C-x 4 M-.
;;   Syntax
;;     Next  C-c C-n/p next/previous error
;;     Check C-c C-v
;;   Reformat  C-c f - set in setup
;;   Refactor  C-c C-e
;;   Debug pdb C-c C-u d
;;   Show Docs C-c C-d
;; ERRORS:
;;   Syntax error after sending code for evaluation, code is on elpy-shell.el line 724, but doesn't seem to have an error
;;   FIND DEF Go to definition - jedi:setup install server (hack: use C-c . and M-,)
;;     May need to first install jedi and then jedi epc server (need virtualenv first). M-x jedi:[re]install-server
;;     SOLN: 1) https://github.com/jorgenschaefer/elpy/issues/1875
;;             - downgraded to Jedi 0.17.2 and only run jedi:setup
;;             - Must do so in rpc-venc: $ source /Users/trevor/.emacs.d/elpy/rpc-venv/bin/activate
;;             - (rpc-venv) $ pip3 uninstall jedi && pip3 install jedi==0.17.2
;;           2) DO NOT start virtual env first - start inside emacs M-x pyvenv-workon

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  (setq python-shell-interpreter "python3")
  (setq python-shell-interpreter-args "-i")
  :config
  ;; (defun elpy-goto-definition-or-rgrep ()
  ;;   "Go to the definition of the symbol at point, if found. Otherwise, run `elpy-rgrep-symbol'."
  ;;   (interactive)
  ;;   (ring-insert find-tag-marker-ring (point-marker))
  ;;   (condition-case nil (elpy-goto-definition)
  ;;     (error (elpy-rgrep-symbol
  ;;             (concat "\\(def\\|class\\)\s" (thing-at-point 'symbol) "(")))))
  ;; :bind ("M-." . elpy-goto-definition-or-rgrep)
  :bind ("C-c f" . elpy-format-code)
  )


;; recentf   From mastering emacs find recent files
;;
(use-package recentf
  :init
  (require 'ido)
  (setq recentf-max-saved-items 50)
  (defun ido-recentf-open ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
    (interactive)
    (if (find-file (ido-completing-read "Find recent file: " recentf-list))
        (message "Opening file...")
      (message "Aborting")))
  (global-set-key (kbd "C-x C-r") 'ido-recentf-open)
  :config
  (recentf-mode t)
  :ensure t
  )

;; Buffer-move:
;;   Swap buffers
(use-package buffer-move
  :ensure t
  )


;;  Zygospore
;; Reverts C-x-1 to bring back killed window https://github.com/LouisKottmann/zygospore.el
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent))
                                        ; automatically indent when press RET
  :ensure t
  )



;; ;; Company
;; (use-package company
;;   :init
;;   (global-company-mode 1)
;;   :config
;;   (add-hook 'after-init-hook 'global-company-mode)

  ;; In setup-cedet we are using semantic, so don't delete for autocompletion:
  ;;  (delete 'company-semantic company-backends)
  ;;
  ;; (define-key c-mode-map  [(control tab)] 'company-complete)
  ;; (define-key c++-mode-map  [(control tab)] 'company-complete)
  ;; )

;; Yasnippet - for adding in in code snippets
(use-package yasnippet
  :defer t
  :init
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  :config
  (yas-global-mode 1)
  :ensure t
  )

(use-package yasnippet-snippets
  :ensure t
  )
;; M-x yas-describe-tables


;; Smart function autocompletion
;; https://github.com/abo-abo/function-args
(use-package function-args
  :ensure t
  :config
  (fa-config-default)
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
  (set-default 'semantic-case-fold t)
  )
  ;; Add in include paths for searching
  ;; Find include path using "gcc -x c++ -v -E /dev/null"
  ;;(semantic-add-system-include "/usr/local/include" 'c++-mode)
  ;;(semantic-add-system-include "/Library/Developer/CommandLineTools/usr/include/c++/v1" 'c++-mode)
  ;;(semantic-add-system-include "/Library/Developer/CommandLineTools/usr/lib/clang/10.0.1/include" 'c++-mode)
  ;;(semantic-add-system-include "/Library/Developer/CommandLineTools/usr/include" 'c++-mode)
  ;;(semantic-add-system-include "/Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk/usr/include" 'c++-mode)
  ;;(semantic-add-system-include "/Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk/System/Library/Frameworks" 'c++-mode)

;; fa-jump
;; fa-show
;; moo-jump-local
;; moo-complete
;;


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
  :ensure t
  )


;; ------------------------------------------------------------------
;;                   C++ IDE from Tuhdo
;;            http://tuhdo.github.io/c-ide.html
;; ------------------------------------------------------------------
;;   Emacs demo setup: https://github.com/tuhdo/emacs-c-ide-demo
;; Adding in setup lisp scripts
(add-to-list 'load-path "~/.emacs.d/custom")
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)) ;; -> can't install counsel or cousel-projectile. Helm should be fine.
(require 'setup-helm)
(require 'setup-helm-gtags)
;; -------------- (require 'setup-cedet) -----------------
;; moved to init file for greater control over semantic parsing
(require 'cc-mode)

;; SEMANTIC stuff --- was not easy to disable. Suggest using the database
(require 'semantic)

(global-semanticdb-minor-mode t)
(global-semantic-idle-scheduler-mode t)  ;; DISABLE AUTOMATIC PARSING AFTER CHANGE
(global-semantic-stickyfunc-mode t)

(semantic-mode t)

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode)

;; ---------------------------------------------------------

(require 'setup-editing)
;; -> This makes yank and pop work better and includes
;;   M-o insert line
;;   C-c i indent region
;;   M-; commenting
;;   replaces search and replace: M-% and C-M-% for regexp
;;   C-a - shoot to beginning of line after whitespace (instead of just beginning)
;;
;;  iedit-mode
;;     C-; - iedit-mode - like multicursor - edit all occurences of in buffer
;;     C-S-i : previous occurences
;;     M-; toggle selection - exit iedit mode (C-;) to disable
;;   C-; - iedit - like multicursor - edit all occurences of in buffer

;; (require 'setup-ggtags)

(use-package sr-speedbar
  :config
  (setq speedbar-show-unknown-files t)
  (setq sr-speedbar-skip-other-window-p t)
  )


;; -----------------------------------------------------------------;;
;; -------------------------   END   -------------------------------;;
;; -----------------------------------------------------------------;;



;; -----------------------------------------------------------------;;
;; -----------------------------------------------------------------;;
;; ------------------   EMACS CUSTOMIZATION   ----------------------;;
;; -----------------------------------------------------------------;;
;; -----------------------------------------------------------------;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(custom-enabled-themes '(wombat))
 '(fill-column 99)
 '(flymake-start-syntax-check-on-newline nil)
 '(grep-command "grep --color=auto -rnH --null -e ")
 '(ido-enable-flex-matching t)
 '(ido-mode 'both nil (ido))
 '(menu-bar-mode 1)
 '(package-selected-packages
   '(neotree jedi virtualenv company-c-headers dockerfile-mode cuda-mode flymake-go sr-speedbar counsel swiper-helm swiper volatile-highlights markdown-mode+))
 '(reb-re-syntax 'string)
 '(safe-local-variable-values
   '((cmake-ide-build-dir . "~/radar/build")
     (cmake-ide-build-dir . "~/code/onboard/build")))
 '(save-place-mode t nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
