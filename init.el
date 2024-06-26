

;; Created : 07 March 2024 
;; Modified : 11 May 2024





;; ---ref 



;; For emacs
;;   - https://github.com/jakebox/jake-emacs/tree/main :: for categorizing the info, packages, everythigns & all key bindings. Still a lot to learn.
;;   - https://blog.sumtypeofway.com/posts/emacs-config.html :: for good write up.
;;   - https://www.pat;   - https://github.com/nordtheme/emacs/blob/develop/nord-theme.el :: studied
;; Resources
;;   - https://www.patrickdelliott.com/emacs.d/
;; All the random people who ask question & who provide the answer even it was 12 years old thread.
;; To the awesome people work whose links that I opens closed, again open to make something work.






;;---categorytable  C A T E G O R Y  T A B L E



;; --- Category Table               :categorytable
;; --- Note                         :note
;; --- Debug                        :debug
;; --- Startup                      :startup
;; --- Syntax Checking              :syntacchecking
;; --- Scrolling                    :scrolling
;; --- Encoding                     :encoding
;; --- Theme                        :theme
;; --- Package Setup                :packagesetup
;; --- Dashboard                    :dashboard
;; --- Tab bar                      :tabbar
;; --- Packages Basic               :packages
;; --- Undo                         :undo
;; --- Mini Buffer Completion       :minibuffercompletion
;; --- --- Vertico                  :mini/vertico
;; --- --- Ivy                      :mini/ivy
;; --- Prescient                    :prescient
;; --- Org                          :org
;; --- --- Org Indentation          :org/indentation
;; --- --- Org Support Packages     :org/orgsupportpackages
;; --- Key Bindings                 :keybindings
;; --- --- Which Key                :key/whichkey
;; --- --- Evil                     :key/evil
;; --- --- General                  :key/general
;; --- Web Dev                      :webdev
;; --- --- Vue                      :web/vue




;; ---version v1.2 11 May 24

;; Added status for study in todo list.
;; Added version control to true.
;; Added support for backup for files but need further improvement.
;; BUG line number mode need further fixing.
;; BUG line trunacating need further fixing but for now it work by manually enabling it even in org mode correclty.
;; Added support for doom theme just for easily test out different theme.
;; Added shortcut for switching tab for centaur-tabs package by C-Tab and C-S-Tab.
;; Added support for popper pkg for different buffers and modes.
;; Added supersave package for saving buffer in different scenario.
;; Modified undo-tree but need further fixing.
;; Added support to show agenda logs of previous days completed tasks by default.k;; Added more todo list items, like "learn, study-book, underway, focus, revist, seek-feedback, etc".
;; Added keyword faces for newly added todo list items.
;; Added support for pdf through pdf-tools.
;; Added org-noter but need further customization to work.
;; Added calfw support for calendar view of task but need further customization.
;; Disabled lsp-bridge because of unexpected multiple crashes. Need extensive look up.
;; Added json-mode for json files.



;; ---version v1.1  22 Apr 24

;; Added category easily searchabel unique name.
;; Added recentf, solves problem of order lising on dashboard.
;; Added 'undo-tree'.
;; Added 'org-journal' which need to be configured correctly.
;; Added keybinding for 'perspective-map' which is ' .
;; Added 'web-mode', support for html, css, js.
;; Added 'vue-mode'.
;; Added 'lsp-bridge' with dependencies 'yasnippet', 'markdown-mode' and other python pkgs.
;; Added 'perspectiver' but need to be configured correctly.
;; Commented Out bookmarks in dashboard-item-shortcuts.
;; Added 'highlight-indent-guides'.
;; Added 'ace-window'.
;; Added agenda customization to work with the schedules.
;; Added org agenda keybindings.
;; Added org-todo-keywords and their faces.
;; Added 'org-bable'
;; Added 'evil-org'

;; ---version v1.0  15 Apr 24

;; - Fix "cursor scrolling where the whole screen shifts scroll without smooth scrolling".
;; - Add everything everything everything basic basic basic. ( took 3x time of waht I thought ).






;; ---note  N O T E



;; --- Basic configuration concept
;;     `:init` is for configuring anything before package loads
;;     `:defer` is for when a package need to load when need & not on start up
;;     `:diminish` is for when you don't want to show minor mode in mode line, it come from package diminish
;;     `:after` does not work as the word suggest, thats why doom emacs use custom after
;;     `:ensure` cause the package to be installed if not already installed. If you don't use it, it will show
;;        `Error (use-package): Cannot load highlight-indent-guides`

;; --- Comments
;;     6 new line after category change
;;     3 new line after the category name
;;     1 new line after the `description of the code`
;;     2 new line after the topic change within a category
;;     0 new line if another `line of code`
;;     3 dash before category name
;;     2 set of 3 dash before sub-category name
;;     Single line comment for single line code is applicable without any newline
;;     The above line is like time-table, we are going to face dissapointment.

;; --- Package
;;     `require` load a feature if not already loaded.
;;     `setq` set the value of a variable that a package, function, feature provides.
;;       - How to know what value it accepts `C-h-v` ( when the cursor is over the variable name )
;;           or type the variable name.
;;       - TODO all related knowledge regarding setting variable
;;         - What value it accepts, list, multiple varibale name with value , etc.

;;     Some times we just write the function name to initiate it like
;;       - like `(tool-bar-mode -1) no need to write setq, why, because its a function
;;       - or like `(pixel-precisous-scroll-mode)` there is no need to suffix t or prefix setq
;;       - If called from Lisp, toggle the mode if ARG is ‘toggle’.  Enable
;;           the mode if ARG is nil, omitted, or is a positive number.
;;           Disable the mode if ARG is a negative number.

;;     (use-package package-name
;;       :init executes before the package loads
;;       :config executes after the package loads
;;       :defer condition
;;         If condition is non-nil, it specifies to defer loading feature until
;;           any of the autoloaded commands or variables of feature are first used.
;;           If condition is a number n, it specifies that feature should be
;;           loaded after n seconds of idle time. 
;;       :commands commnds of feture to autoload
;;       :bind to add keybindings
;;     Order of package loading is important, so make sure its dependencies are loaded first.






;; ---debug  D E B U G



;; Use `M-x show-paren` if any paran mismatch
;; Use 'emacs -q' to start emacs without any config


;; While `debug-on-error` gives more detailed info if anything fails
;;   - Both `debug-on-error` & `debug-on-signal` are not enough to locate the problem
;;     but both some info to work on it
;;   - Ref :
;;     https://emacs.stackexchange.com/questions/54455/how-to-get-a-stack-trace-for-eager-macro-expansion-failure

(setq debug-on-error t)
; (setq debug-on-signal t) ;; Press esc for debuggert to go to next error while in debug mode.






;; ---startup  S T A R T  U P



;; `Custom-file` saves any face ( apperance change / variable change ) that user does from within emacs GUI tool
;; If this path not defined then if any changes made from gui, emacs will insert custom line
;;   at the bottom of the `init.el` file. And that can get messey because it just a string of info not readable
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(setq version-control t)
(setq make-backup-files nil)
;; backup by copying how its doing now
(setq backup-by-copying t)

(setq delete-old-versions t)
(setq kept-new-versions 5)
(setq kept-old-versions 5)

; (setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
(setq backup-directory-alist (list (cons "." (concat user-emacs-directory "backup/"))))

;; A custom start up screen
;; (defun my-startup-screen ()
;;   "Display a custom startup screen with text and colors."
;;   (frame-set-title "Welcome to Emacs!")
;;   (text-mode)
;;   (insert "\n\n**   _   _  _   _  _   _ \n**  | | | || | | || | | |\n**  | |_| || |_| || |_| |\n**  |  _  ||  _  ||  _  |\n**  | | | || | | || | | |\n**  |_| |_||_| |_||_| |_|\n\n** Emacs is ready!**\n")
;;   (progn
;;     (set-face-foreground 'default white)
;;     (set-face-background 'default blue)))
;; ;; (add-hook 'after-init 'my-startup-screen)

;; Disable emacs default gui menus
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)  
(setq inhibit-scratch-message t)

 ;; Save existing clipboard text into the kill ring before replacing it.
(setq save-interprogram-paste-before-kill t)

;; Make `ESC` quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Disable default emacs startup screen
(setq inhibit-startup-message t)

;; font
(set-face-attribute 'default nil
					:family "Iosevka"
					:weight 'medium)
(setq inhibit-compacting-font-caches t)
;; (add-to-list 'default-frame-alist '(font . "Iosevka Extended")) ;; NotWorked
;; ;; (set-frame-font "Iosevka Extended" t t nil) ;; NotWorked

;; `Fringe mode` adds more space left & right of emacs frame
(set-fringe-mode 20)

;; Highlights current cursor line
;; ;; (hl-line-mode +1)

;; It saves emacs window config (like vertical split / horizontal split) project dir wise
;;   So same session can be start up after restarting emacs
;; Should not be used with perspective
;; (desktop-save-mode 1) 

;; According to internet window layout in emacs sometime get messed up
;;   so they use `winner mode` , it will revert back the window config
(winner-mode 1) 

;; Garbage collection is done to collect unused memory space that is left by program
;;   Default size for 64bit system for collecting garbase is 800,000 (7.6MiB)
;;   So when it reaches is limit 7.6mb while at startup, it start to do collection
;;   which costs time in start up.
;; In modern pc we don't need to collect memory garbage at this limit, especially at startup
;;   we have enough resource to accomodate this garbage, so it can be cleared up after the startup
;; Increasing the threshold for garbage collection can solve the problem
;; Ref :
;;   - https://www.gnu.org/software/emacs/manual/html_node/elisp/Garbage-Collection.html
;;   - https://www.reddit.com/r/emacs/comments/yzb77m/an_easy_trick_i_found_to_improve_emacs_startup/

;; (setq gc-cons-threshold 100000000)

;; Edit mode modification
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

;; When emacs asks for "yes" or "no", let "y" or "n" suffice
(setq use-short-answers t)

 ;; Confirm to quit
(setq confirm-kill-emacs 'yes-or-no-p)

;; Mode of new buffers
;; (setq initial-major-mode 'org-mode
;;       initial-scratch-message ""
;;       initial-buffer-choice t) 

;; These are function and not need to use `setq`,
;;   it just need to run
;; (display-line-numbers-mode 1)
;; (global-display-line-numbers-mode)

;; There is a confusion if previous 2 lines are required or not
;;   but will check
;; Line numbers can be t, 'relative, other stuff also available
;; (setq display-line-numbers 'relative)

;;   (defun display-line-numbers--turn-on ()
;;     "Turn on `display-line-numbers-mode'."
;;     (unless (or (minibufferp) (eq major-mode 'pdf-view-mode))
;;       (display-line-numbers-mode 1)))

;; (display-line-numbers--turn-on )

;; Disable line numbers for some mode
;; (dolist (mode
;; 		 '(org-mode-hook
;; 		   term-mode-hook
;; 		   eshell-mode-hook))
;;   (add-hook mode (lambda ()
;; 				   (display-line-numbers-mode 0)))) 

;; As the side line number increases in digits, the whole window
;;   need to be shifted right, which cost computation.
;; This is why as least some space need to be separated from start.
(setq-default display-line-numbers-width 5)

;; Wrap the line in next line if it exceed the window boundry
;; Doc required it should not be used with `visual-line-mode`
;;   as it may create confusion
;;   But I did not understand it. Blaaaaaaaaaaaaaaaaaaaaaaa
(setq truncate-lines t)

;; Tabs are not working anyway
(setq tab-width 4)

;; Column beyond which automatic line-wrapping should happen
(setq fill-column 80) ;; NotWorking

;; Highlight cursor line
(setq line-move-visual t) ;; NotWorking

;; Remembers where you left the cursor last time
;;   just like how your ex/gf/wife/partner/2am_realization remembers your mistakes buffer by buffer.
;; Ref - https://www.emacswiki.org/emacs/SavePlace
;; Below is old one
;; (use-package saveplace
;;   :init (setq save-place-limit 100)
;;   :config (save-place-mode))
;; Below is new one after v25.1, saves file in `.emacd/places`
(save-place-mode)

;; Make buffer name unique
;; Ref - https://www.emacswiki.org/emacs/uniquify
(require 'uniquify)
(setq uniquify-buffer-name-syle 'forward)

;; Highlight matching parenthesis
;; Ref - https://www.emacswiki.org/emacs/ShowParenMode
(require 'paren )
(setq show-paren-delay 0.1
        show-paren-highlight-openparen t
        show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t )
(show-paren-mode 1)

;; Opens 'recent' file
;; Ref - https://www.emacswiki.org/emacs/RecentFiles
(require 'recentf)
(setq recentf-auto-cleanup 'never
	  recentf-max-menu-items 25
	  recentf-max-saved-items 200)
(setq recentf-filename-handlers ;; Show home folder path as a ~
        (append '(abbreviate-file-name) recentf-filename-handlers))
;; Save the recent file every 5 minutes, Why - by default emacs save
  ;; file list on exit, but what if it exit unexpectedly.
(run-at-time nil (* 5 60) 'recentf-save-list)
(recentf-mode 1)

;; Draw a line between echo area and something named LV
;; What is LV
;; (setq lv-use-separator 1) ; Does not work

;; Line wrapping 
;; There is also 'word-wrap' which enable by below function
;; Have to look if it get individually enable
;; Some problem with 'global-truncate-line'
;; And when identation is enabled in org mode, visual-line-mode will start from start next line
;; (visual-line-mode 1)

;; Word wrapping and truncating in emacs is little complicated.
;; As turncate-line does not take effec if truncate-partial-width-windows is true/number.
;; Word wrapping does not take effect if truncate-lines is enabled.
;; Thats why setq-default is used for word-wrap.
;; The limitation above is described in their documentation.
;; Visual line mode can also be enabled without below 3 lines but as in documentation,
;; it will create problem with org-indentation.
;; So its a circle of confusion.
(setq-default word-wrap t)
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)






;; ---syntaxchecking  S Y N T A X  C H E C K I N G



;; Syntax checking for many programming language 'flymake'
;; Ref - https://www.gnu.org/software/emacs/manual/html_node/emacs/Flymake.html
;; (require flymake)
;; (setq flymake-fringe-indicactor-position 'left-fringe)
;; (setq flymake-suppress-zero-counters t)
;; (setq flymake-start-on-flymake-mode t)
;; (setq flymake-no-changes-timeout nil)
;; (setq flymake-start-on-save-buffer t)
;; (setq flymake-proc-compilation-prevents-sysntax-check t)
;; (setq flymake-wrap-around nil))
;; (flymake-mode 1)


;; Normal spelling checking 'ispell'
;; Ref - https://www.gnu.org/software/emacs/manual/html_node/emacs/Spelling.html
;; A program should be installed in the system to make it work
;; (setq ispell-program-name "hunspell")
;; (setq ispell-local-dictionary "en_US")
;; (setq ispell-local-dictionary-alist '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
;; (setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist)






;; ---scrolling  S C R O L L I N G 



;; A margin is kept from cursor to the window bottom and top
;;   So it is easer to scroll while able to read next upcomming line
;; Basically scrolling will starts before 10 lines of top and bottom
(setq scroll-margin 10)

;; By default when you reach the end of buffer window, emacs will scroll in flash
;;   and center the curor at middle.
;; By setting it to 1, it will scroll line by line
;; Exceeding 100 also has different effect.
;; Need to study more - https://www.gnu.org/software/emacs/manual/html_node/emacs/Auto-Scrolling.html

(setq scroll-conservatively 101)

;; Disables the scoll bar at right side, which looks ugly
;;   and no simple way to change color of it
;; Part of GUI mode disable at top
(scroll-bar-mode -1)

(setq mouse-wheel-follow-mouse t)
(setq mouse-wheel-progressive-speed t)

;; The most important setting of all! Make each scroll-event move 2 lines at
;; a time (instead of 5 at default). Simply hold down shift to move twice as
;; fast, or hold down control to move 3x as fast. Perfect for trackpads.
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 3) ((control) . 6)))

;; Prevents emacs from frontifing fonts when scrolling really fast
;;   so emacs don't waste time on items which we don't want to see anyway
;; Still not sure if is working or not, cause I don't see any great scroll boost
(setq fast-but-imprecise-scrolling t) ;; NotWorking

;; I found smooth scrolling
;; How may month I have scrolled in laggy line based
;;   But this is butter that I fell in love with.
;; Disable `mouse-wheel-scroll-amount ...`
;;   For emacs not get confuse. Prevent a laggy experience.
;; Ref
;;   - https://def.lakaban.net/2023-03-05-high-quality-scrolling-emacs/
(pixel-scroll-precision-mode )






;; ---encoding  E N C O D D I N G



;; Check which encoding system emacs is using `C-h-v` `buffer-file-encoding-system`

;; What I got from chatgpt
;; (fboundp 'set-charset-priority): This checks if the function
;;   `set-charset-priority` is defined and bound to a function.
;; The function `fboundp` is used for checking whether a function is defined or not.

(when (fboundp 'set-charset-priority)
  ;; `(set-charset-priority 'unicode)`: If set-charset-priority function is defined,
  ;; it sets the charset priority to Unicode. This function is typically used to set
  ;; the priority of character sets, ensuring that Unicode characters are given preference.
  (set-charset-priority 'unicode))       

;; It tells Emacs to prefer UTF-8 encoding when dealing with text files,
;; which is a common choice for supporting a wide range of characters, including international characters.
(prefer-coding-system 'utf-8)    

;; The locale-coding-system variable determines the coding system Emacs uses
;; to decode file names and environment variables. By setting it to UTF-8,
;; Emacs ensures proper handling of file names and environment variables encoded in UTF-8.
(setq locale-coding-system 'utf-8) 






;; ---theme  T H E M E



;; Add custom theme folder
;; What below code do ?
;;   Finds the folder, and removes the current ( . ) and previous ( .. ) dir
;;     and then add them to the theme folder one by one, so you can add as many theme folder as you want.
;;   I don't understand the code, I copied ! and I don't want to learn and it just works.
(let ((basedir "~/.emacs.d/themes/"))
  (dolist (f (directory-files basedir))
    (if (and (not (or (equal f ".") (equal f "..")))
	     (file-directory-p (concat basedir f)))
	(add-to-list 'custom-theme-load-path (concat basedir f)))))

;; This is custom citylights theme written from scracth
;;   based on citylights theme, which is also available via doom-themes
;;   but customization of theme was hard, and limited
;;   and there was no separate citylights theme for emacs available.
;; So decided to write whole theme file from scratch for emacs.
(load-theme 'citylights t)

;; How to install theme from repo
;; (use-package gruvbox-theme
;;   :config
;;   (load-theme 'gruvbox))

;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   (setq doom-themes-enable-bold nil
;; 		doom-themes-enable-italic nil)
;;   (load-theme 'doom-one t)
;;   ;; (doom-themes-org-config)
;;   )





;; ---packagesetup P A C K A G E  S E T U P



;; LOOK if the packages do not connect without this line
;; then no need for enabling this line

;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;; (defadvice package-compute-transaction
;;     (around package-compute-transaction-fix activate)
;;   "Fix order of requirements."
;;   (let ((package-list (ad-get-arg 0)))
;;     (let (package-list)
;;       (ad-set-args 0 (list nil  (ad-get-arg 1)))
;;       ad-do-it)
;;     (dolist (elt (nreverse ad-return-value))
;;       (setq package-list (cons elt (delq elt package-list))))
;;     (setq ad-return-value package-list)))

;; Package initialization
;; `require` load a feature if not already loaded.
(require 'package)

;; Some package are in melpa but not in stable melpa, so added both repo.
;; Do not add the `repo` all together ( keep it on separate add-to-list ),
;;   melpa will get sad and not connect to it.
;;   I do not know why, but neither the internet.
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("elpa" . "https://elpa.gnu.org/packages/"))

;; Did not worked, do not write like this.
;; (add-to-list 'package-archives
;;       '(("melpa-stable" . "https://stable.melpa.org/packages/")
;; 	    ("elpa" . "https://elpa.gnu.org/packages/")) t)
;;   (setq package-archives
;;       '(("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/")
;;         ("org"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/org/")
;;         ("gnu"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/gnu/")))

;; Bootstrap package loading
;; Loads package manager
;;   Emacs has built in package manager `package.el` which need to be started like this ( I guess ).
;; Set up package archive from where to download or update package
;;   Default repos are gnu elpa and any other repo that provide by 'pacakge-archives
;; Load installed package
(package-initialize)

;; Treat every package as though it had specified using ‘:ensure SEXP’.
;; (setq use-package-always-ensure t)

;; Checks if any new package has been wrtten on init file
;;   If its written then install it or already installed then do nothing.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))






;; ---dashbaoard  D A S H B O A R D



;; The first look need to be great
;; Ref - https://github.com/emacs-dashboard/emacs-dashboard
(use-package dashboard 
             :ensure t
             :config 
             (dashboard-setup-startup-hook)) 

;; Set the title
(setq dashboard-banner-logo-title "olfREG314")

;; Set the banner
;; (setq dashboard-startup-banner "~/.emacs.d/olfreg314_symbol_freehand_color_2.png" )
;; Adding image works but there is no size configuring option
;; so the image is quite large and need to be some how converted
;; or there is a need to convert the art to ASCII art.
;; Value can be:
;;   - 'official which displays the official emacs logo.
;;   - 'logo which displays an alternative emacs logo.
;;   - an integer which displays one of the text banners
;;     (see dashboard-banners-directory files).
;;   - a string that specifies a path for a custom banner
;;     currently supported types are gif/image/text/xbm.
;;   - a cons of 2 strings which specifies the path of an image to use
;;     and other path of a text file to use if image isn't supported.
;;     ("path/to/image/file/image.png" . "path/to/text/file/text.txt").
(setq dashboard-startup-banner 2 )

;; Content is not centered by default. To center, set
;; It works actually, not like the css
(setq dashboard-center-content t)

;; vertically center content
(setq dashboard-vertically-center-content t)

;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts t)

;; Number of items in each category
(setq dashboard-items '((recents   . 10)
                        ;; (bookmarks . 10)
                        (projects  . 10)
                        (agenda    . 10)
                        (registers . 10)))

;; Press tab to go next item
(setq dashboard-navigation-cycle t)

(setq dashboard-heading-shorcut-format " [%s]")

(setq dashboard-item-shortcuts '((recents   . "r")
                                 ;; (bookmarks . "m")
                                 (projects  . "p")
                                 (agenda    . "a")
                                 (registers . "e")))

;; (setq dashboard-item-names '(("Recent Files:"               . "Recently opened files:")
;;                              ("Agenda for today:"           . "Today's agenda:")
;;                              ("Agenda for the coming week:" . "Agenda:")))

;; (setq dashboard-items-default-length 20)

;; (add-to-list 'dashboard-items '(agenda) t)

;; (setq dashboard-week-agenda t)

;; use `all-the-icons' package
;; (setq dashboard-icon-type 'all-the-icons)  

;; ;; (setq dashboard-set-heading-icons t)
;; ;; (setq dashboard-set-file-icons t)

;; ;; To use it with `counsel-projectile'
;; (setq dashboard-projects-switch-function 'counsel-projectile-switch-project-by-name)






;; ---tabbar  T A B  B A R



;; Without power line centaur-tabs will not work
;; Ref - https://github.com/ema2159/centaur-tabs/issues/11
(use-package powerline
  :ensure t)


(use-package centaur-tabs
  :demand
  :config
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-plain-icons t)
  (setq centaur-tabs-height 22)
  (setq centaur-tabs-set-bar 'left)
  (setq centaur-tabs-close-button "   x  ") 
  (setq centaur-tabs-set-modified-marker t)
  (setq centaur-tabs-modified-marker "   *  ")
  (setq centaur-tabs-cycle-scope 'tabs)
  (setq centaur-tabs-show-navigation-buttons t)
  (setq centaur-tabs-show-count t)

  (centaur-tabs-headline-match)
  (centaur-tabs-group-by-projectile-project)
  (centaur-tabs-mode t)
  :hook
  (dashboard-mode . centaur-tabs-local-mode)
  ;; In emacs TAB and <tab> has different meanings.
  ;; Ref - https://emacs.stackexchange.com/questions/9631/what-is-the-difference-between-tab-and-tab
  :bind ( ("C-<tab>" . centaur-tabs-forward)
	  ("C-<iso-lefttab>" . centaur-tabs-backward ))
  
  )
  





;; ---packages  B A S I C  P A C K A G E S



;; If any package does not install via relaoding, do M-x package install <nameof the package>
;; I don't understand where the problems lies, casue emacs is not giving enough info
;; Why it not able to install a certain package. Its network, don't find in repo, just said can't load.


;; Diminish pkg Does not show minor mode in mode line
;; :diminish can be used with use-package
(use-package diminish
             :ensure t)


;; Makes scroll bar decent looking
;; Ref - https://github.com/emacsorphanage/yascroll
;; (use-package yascroll
;;   :ensure
;;   :config
;;   (global-yascroll-bar-mode))


;; Make jumping smooth
;; Ref - https://github.com/emacsmirror/scroll-on-jump
;; (use-package scroll-on-jump
;;   :config
;;   (setq scroll-on-jump-duration 0.6))


;; ; Highlights previously visible part when scrolling
;; ;; (use-package on-screen
;; ;;   :config
;; ;;   (setq on-screen-global-mode +1)) 


;; Highlights the cursor whenever it moves
;; Ref - https://github.com/Malabarba/beacon
(use-package beacon
  :diminish
  :config
  (setq beacon-color "#539afc")
  (beacon-mode))


;; Highlight any hex value even if its string not like the vim one
;; May need to enable in buffers M-x rainbow-mode
;; Ref - https://github.com/emacsmirror/rainbow-mode
(use-package rainbow-mode
  :diminish
  :commands rainbow-mode
  :config
  (setq rainbow-ansi-colors nil )
  (setq rainbow-x-colors nil ))


;; I don't know what I will use it for, somehow it is in my init
;; Ref - https://github.com/lewang/command-log-mode?tab=readme-ov-file
;; (use-package command-log-mode)


;; Not that smart
;; (use-package smart-mode-line
;;   :config
;;   (setq sml/no-confirm-load-theme t)
;;   (setq sml/theme 'atom-one-dark)
;;   (sml/setup))

;; Good theme
;; (use-package smart-mode-line-atom-one-dark-theme
;;   :ensure t)


;; Does live up to its name. I don't know what it changed.
;; Ref - https://github.com/gexplorer/simple-modeline
(use-package simple-modeline
  :diminish
  :hook (after-init . simple-modeline-mode))


;; This is highest writer room, I am allowed in !
;; Ref - https://github.com/joostkremers/writeroom-mode
(use-package writeroom-mode 
             :defer t 
             :config 
             (setq writeroom-maximize-window nil 
                   writeroom-mode-line t 
                   writeroom-global-effects nil ;; No need to have Writeroom do any of that silly stuff 
                   writeroom-extra-line-spacing 3) 
             (setq writeroom-width visual-fill-column-width))


;; NOTE: The first time you load your configuration on a new machine, you'll
;; need to run the following command interactively so that mode line icons
;; display correctly:
;;
;; M-x all-the-icons-install-fonts
(use-package all-the-icons)


;; Srefactor is a parser for C/C++, does something which I don't understand
;; but it also does lisp code formatting
;; just run `srefactor-lisp-format-buffer`
;; Not a good formatter though
;; (use-package srefactor
;;             :config
;;             (semantic-mode 1))

;; (require 'srefactor-lisp) 


;; Projectile manages projects
;; Ref - https://docs.projectile.mx/projectile/projects.html
(use-package projectile 
             :ensure t 
             :pin melpa-stable 
             :init 
             (projectile-mode 1) 
             :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map))
             :config 
             (setq projectile-project-search-path '("~/prj*/" "notes" ("~/github" . 1))) 
             (setq projectile-auto-discover nil))


;; Genreal need to loaded at first for :general keyword in use-package
;; Tried use :after general in some packages that require general but it just not loading
(use-package general
             :demand t)


;; Popper helps with switch between pop ups
;; C-` : toggle message M-` does something but not what I expected
(use-package popper
  :ensure t ; or :straight t
  :bind (("C-`"   . popper-toggle)
         ("M-'"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '(custom-mode
	  compilation-mode
	  message-mode
	  help-mode
	  occur-mode
	  "^\\*Warning\\*"
	  "^\\*Compile-log\\*"
	  "^\\*Backtrace\\*"
	  "^\\*Messages\\*"
	  "^\\*Completions\\*"
	  "^\\*scratch\\*"
	  "^\\*eshell\\*"

          "Output\\*$"
          "\\*Async Shell Command\\*"
          "\\*Shell Command Output\\*"
	  "[Oo]output\\*"
          ))
  (setq popper-group-function #'popper-group-by-projectile)
  (popper-mode +1)
  ;; For echo area hints
  (popper-echo-mode +1))


;; Edting root level file
(use-package sudo-edit)


;; Highlight indent in buffers
;; Ref - https://github.com/DarthFennec/highlight-indent-guides/tree/cf352c85cd15dd18aa096ba9d9ab9b7ab493e8f6
;; Not showing correct indentation in org mode.
(use-package highlight-indent-guides
  :ensure t
  :config
  (setq highlight-indent-guides-method 'character)
  ;; (set-face-background 'highlight-indent-guides-character-face 'nil)
  (setq highlight-indent-guides-auto-character-face-perc 100)
  (setq highlight-indent-guides-responsive 'top)
  (highlight-indent-guides-mode ))


;; Did not worked well in org mode too.
;; (use-package indent-guide
;;   :ensure t
;;   :diminish t
;;   :defer t
;;   :config
;;   (setq indent-guide-recursive t)
;;   (indent-guide-global-mode))


(use-package ace-window
  :ensure t
  :bind ("M-o" . ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-background nil)
  ;; Does not switch window immediately but way to next action
  ;; Ref - https://github.com/abo-abo/ace-window
  ;; (setq aw-dispatch-always t)
  )


(use-package super-save
  :ensure t
  :diminish super-save-mode
  :defer 2
  :config
  (setq super-save-auto-save-when-idle t
	super-save-idle-duration 5
	super-save-triggers
	'(evil-window-next evil-window-prev ace-window balance-windows other-window next-buffer previous-buffer))
	(super-save-mode +1))
  






;; ---undo  U N D O



(use-package undo-fu
  :config
  (setq undo-limit 67108864) ;; 64mb
  (setq undo-strong-limit 100663296) ;; 96mb
  (setq undo-outer-limit 1006632960)) ;; 960mb

(use-package undo-fu-session
  :config
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\ '")))

(undo-fu-session-global-mode 1 )

;; Ref - https://github.com/emacsmirror/undo-tree/blob/master/undo-tree.el
;; When the problem arises I will look into it
;; (use-package undo-tree
;;   :ensure t
;;   :config
;;   (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
;;   (setq undo-tree-auto-save-history t)

;;   (global-undo-tree-mode))






;; ---minibuffercompletion  M I N I  B U F F E R  C O M P L E T I O N






;; ---mini/vertico  ---  V E R T I C O



;; What is it - https://www.reddit.com/r/emacs/comments/ktuizj/emacs_embark_and_my_extras/ 
;; 'embark' can target a thing ( which can be region, text, function, etc ) & then shows
;;   you a set of function that you can perform on that. If I understood correctly then there is no
;;   need to typing keymaps manually for everything just like I did with general.
;;   But yes customization is available in 'embark' to add key too.
;; 'Embark' is like counsel for vertico
;;   Ref - https://github.com/oantolin/embark
;; 'Consult' is also used with vertico, its like 'swiper' in ivy

;; (use-package embark
;;   :ensure t
;;   :bind
;;   (("C-." . embark-act)         ;; pick some comfortable binding
;;    ("C-;" . embark-dwim)        ;; good alternative: M-.
;;    ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'
;;   :init
;;   ;; Optionally replace the key help with a completing-read interface
;;   (setq prefix-help-command #'embark-prefix-help-command)
;;   ;; Show the Embark target at point via Eldoc. You may adjust the
;;   ;; Eldoc strategy, if you want to see the documentation from
;;   ;; multiple providers. Beware that using this can be a little
;;   ;; jarring since the message shown in the minibuffer can be more
;;   ;; than one line, causing the modeline to move up and down:
;;   ;; (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
;;   ;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)
;;   :config
;;   ;; Hide the mode line of the Embark live/completions buffers
;;   (add-to-list 'display-buffer-alist
;;                '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
;;                  nil
;;                  (window-parameters (mode-line-format . none)))))


;; Vertical completion like 'Ivy'
;; Ref - https://github.com/minad/vertico
;; (use-package vertico
;;              :init 
;;              (vertico-mode) 
;;              ;; Different scroll margin 
;;              (setq vertico-scroll-margin 0) 
;;              ;; Show more candidates 
;;              (setq vertico-count 20) 
;;              ;; Grow and shrink the Vertico minibuffer 
;;              (setq vertico-resize t) 
;;              ;; Optionally enable cycling for `vertico-next' and `vertico-previous'. 
;;              (setq vertico-cycle t))


;; Persist history over Emacs restarts.  Vertico sorts by history position.
;; Does it not work without enabling with vertico, I do know but have to check.
;; (use-package savehist
;;   :init
;;   (savehist-mode 1 ))


;; A few more useful configurations...
;; for vertico, I don't know what it does
;; (use-package emacs
;;   :init 
;;   ;; Add prompt indicator to `completing-read-multiple'.
;;   ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
;;   (defun crm-indicator (args)
;;     (cons (format "[CRM%s] %s"
;;                   (replace-regexp-in-string
;;                    "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
;;                    crm-separator)
;;                   (car args))
;;           (cdr args)))
;;   (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

;;   ;; Do not allow the cursor in the minibuffer prompt
;;   (setq minibuffer-prompt-properties
;;         '(read-only t cursor-intangible t face minibuffer-prompt))
;;   (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
;;   ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
;;   ;; Vertico commands are hidden in normal buffers.
;;   ;; (setq read-extended-command-predicate
;;   ;;       #'command-completion-default-include-p)
;;   ;; Enable recursive minibuffers
;;   (setq enable-recursive-minibuffers t))


;; Optionally use the `orderless' completion style.
;; (use-package orderless
;;   :init
;;   ;; Configure a custom style dispatcher (see the Consult wiki)
;;   ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
;;   ;;       orderless-component-separator #'orderless-escapable-split-on-space)
;;   (setq completion-styles '(orderless basic)
;;         completion-category-defaults nil
;;         completion-category-overrides '((file (styles partial-completion)))))






;; ---mini/ivy  ---  I V Y



;; Minibuffer completion
;; 'Ivy' - Main pkg for completion.
;; 'Counsel' - Took some emacs basic command, enchanced it for 'Ivy'.
;; 'Swiper' - Took Isearch, enhanced it for 'Ivy'.


;; Should be loaded before ivy
(use-package counsel 
             :config 
             (setq default-directory "~/" ) 
             ;; Removes recentfiles/bookmarks from counsel-switch-buffer 
             (setq counsel-switch-buffer-preview-virtual-buffers nil) 
             ;;(setq couns;; el-find-file-ignore-regexp 
            ;;        (concat 
            ;;          ;; That weird Icon? file in Dropbox. 
            ;;          "\\(Icon\ 
            ;;          \\)" 
            ;;        ;; Hides file names beginning with # or . 
            ;;        "\\|\\(?:\\`[#.]\\)"))
            ;; emacs regexp notes: had to put \\| before the second regexp to make this work
            ;; Sorts counsel-rec
			;;  entf in order of time last accessed 
            (add-to-list 'ivy-sort-functions-alist '
                         (counsel-recentf . file-newer-than-file-p)) 
            (add-to-list 'recentf-exclude 
                         (expand-file-name "projectile-bookmarks.eld" user-emacs-directory))
            ;; Use fd 
            (setq find-program "fd")
            ;; follow symlinks, files, show hidden 
            (setq counsel-file-jump-args (split-string "-L --type f -H")) 
            :general
            (general-define-key :keymaps 'counsel-find-file-map 
                                ;; when in counsel-find-file, run this to search 
                                ;;the whole directory recursively
                                "C-c f" 'counsel-file-jump-from-find) )


;; Minibuffer completion mode for commands and other stuff
(use-package ivy 
             :diminish ivy-mode 
             :config 
             (setq ivy-use-virtual-buffers t)
             (setq ivy-count-format "(%d/%d) ")
             ;; Hides . and .. directories 
             (setq ivy-extra-directories nil) 
             ;; Removes the ^ in ivy searches 
             (setq ivy-initial-inputs-alist nil) 
             (setq ivy-fixed-height-minibuffer nil) 
             ;; Number of lines in when pressing M-x
             (add-to-list 'ivy-height-alist '(counsel-M-x . 15)) 
             ;; Shows a preview of the face in counsel-describe-face
             (add-to-list 'ivy-format-functions-alist 
                          '(counsel-describe-face . counsel--faces-format-function))
             (ivy-mode 1)
              :general 
              (general-define-key
              ;; Also put in ivy-switch-buffer-map 
              ;; b/c otherwise switch buffer map overrides and C-k kills buffers 
              :keymaps '(ivy-minibuffer-map ivy-switch-buffer-map) 
              ;; "S-SPC" 'nil 
              ;; Default is S-SPC, changed this b/c sometimes I accidentally hit S-SPC 
              ;; "C-SPC" 'ivy-restrict-to-matches 
              ;; C-j and C-k to move up/down in Ivy 
              "C-k" 'ivy-previous-line 
              "C-j" 'ivy-next-line))


; Nice icons in Ivy. Replaces all-the-icons-ivy.
(use-package all-the-icons-ivy-rich 
             :init (all-the-icons-ivy-rich-mode 1) 
             :config 
             (setq all-the-icons-ivy-rich-icon-size 1.0))


;; Changes how minibuffer ivy show candidate ( items ),
;;   Its like how to format items there to give more and clean info.
;; Ref - https://github.com/Yevgnen/ivy-rich?tab=readme-ov-file
(use-package ivy-rich
  :after ivy
  :init
  (setq ivy-rich-path-style 'abbrev)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  :config
  (ivy-rich-mode 1))






;; ---prescient  P R E S C I E N T



;; Sort filter lists of candidate, work well with 'ivy' and 'company'
;; Ref - https://github.com/radian-software/prescient.el
(use-package prescient
  :config
  (setq-default history-length 1000)
  (setq-default prescient-history-length 1000) ;; More prescient history
  (prescient-persist-mode +1))


;; Use `prescient' for Ivy menus.
(use-package ivy-prescient
  :after ivy
  :config
  ;; don't prescient sort these commands
  (dolist (command '(org-ql-view counsel-find-file fontaine-set-preset))
    (setq ivy-prescient-sort-commands (append ivy-prescient-sort-commands (list command))))
  (ivy-prescient-mode +1))


;; (use-package company-prescient
;;   :defer 2
;;   :after company
;;   :config
;;   (company-prescient-mode +1))






;; ---org  O R G



;; Default files will be created here
(setq org-directory "~/notes")

;; Org Capture will save into this file
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; Hide leading stars, use it with org-adapt-identation
;; but not required when using org-indent-mode as it does automatically
(setq org-hide-leading-stars t)

;; Org styling, hide markup etc.
(setq org-hide-emphasis-markers t )
(setq org-pretty-entities t )
(setq org-ellipsis "…" )
(setq org-startup-folded 'showeverything)
(setq org-image-actual-width 300)

(setq org-log-done t)
(setq org-log-into-drawer t)

;; M-Ret can split lines on items and tables but not headlines and not on anything else (unconfigured)
(setq org-M-RET-may-split-line '((headline) (item . t) (table . t) (default)))

;; Syntax highlighting in org src block
(setq org-src-fontify-natively t)

;; Removes gap between headings when you add a new heading
;; (setq org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))

;; I hope it works
(setq org-catch-invisible-edits 'show-and-error)

;; Does something, I will uncomment when problem arise 
;; (setq org-auto-align-tags nil )

;; (setq org-tags-column 0 )

;; (setq org-special-ctrl-a/e t )

;; (setq org-insert-heading-respect-content t )

(setq org-dealine-warning-days 30)

; If something is done, don't show its deadline
(setq org-agenda-skip-deadline-if-done t)

;; If something is done, don't show when it's scheduled for
(setq org-agenda-skip-scheduled-if-done t)

;; If something is scheduled, don't tell me it is due soon
(setq org-agenda-skip-deadline-prewarning-if-scheduled t)

(setq org-agenda-show-log t)

;; Will show previous days done list, so you can see what you have done yesterday or the day before that.
(setq org-agenda-start-with-log-mode t)

;; Agenda styling
;; (setq org-agenda-tags-column 0 )
;; (setq org-agenda-block-separator ?─ )
;; (setq org-agenda-time-grid
;; 	  '((daily today require-timed)
;; 	    (800 1000 1200 1400 1600 1800 2000)
;; 	    " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")))
;; (setq org-agenda-current-time-string
;;  "◀── now ─────────────────────────────────────────────────")

;; Some function to keybinding that may be look into future
;; Evil take care of by the way but still will look
  ;; :bind (("C-c o c" . counsel-org-capture)
  ;;        ("C-c o a" . org-agenda)
  ;;        :map org-mode-map
  ;;        ("M-<left>" . nil)
  ;;        ("M-<right>" . nil)
  ;;        ("C-c c" . #'org-mode-insert-code)
  ;;        ("C-c a f" . #'org-shifttab)
  ;;        ("C-c a S" . #'zero-width))

;; Org function to look in future
  ;; (org-return-follows-link t)
  ;; (org-src-ask-before-returning-to-edit-buffer nil "org-src is kinda needy out of the box")
  ;; (org-src-window-setup 'current-window)
  (setq org-agenda-files (list org-directory))
  ;; (defun pt/org-mode-hook ()
  ;;   (when (s-suffix? "todo.org" (buffer-file-name (current-buffer)))
  ;;     (real-auto-save-mode)))
  ;; (defun make-inserter (c) '(lambda () (interactive) (insert-char c)))
  ;; (defun zero-width () (interactive) (insert "​"))
  ;; (defun org-mode-insert-code ()
  ;;   "Like markdown-insert-code, but for org instead."
  ;;   (interactive)
  ;;   (org-emphasize ?~))))

(setq org-todo-keywords
      '((sequence "TODO" "PROG" "HOLD" "UPDATE" "IDEA" "NOTE" "ACTIVE" "|"  "DONE" "CANCELED")
        ;; (sequence "WORK" "HOME" "|" "DONE")

	                                      ;; For Study     
	 
	(sequence "LEARN"                     ;; Currently studying the topic and making physical or digital notes.
		  "STUDY-BOOK"                ;; Book which currently reading

	          "UNDERWAY"                  ;; Indicates tasks or topics that are actively studying or working on.
		  "FOCUS"                     ;; Signifies tasks or topics that require focused attention.

		  "REVISIT"                   ;; Topics that need to be revist to understand better.
		  ;; "SEEK-FEEDBACK"          ;; Topics that need to be asked to peers, teachers, metors.

	          "CRE-CHEATSHEET"            ;; Creating cheatsheet (a way to summerise and easy searchable note) physically.
	          "CRE-DIGI-CHEATSHEET"       ;; Create cheatsheet digitally throught latex

	          "|"  

	          "MASTERED"                  ;; When the topic complete.
		  )
                                              ;; For projects

        (sequence "BACKLOG"                   ;; Featues, fix that need to be implemented but which are not in priority
                  "IDEA"                      ;; Space for capture new concepts, suggestions, improvements

                  "PLANNING"                  ;; Items which are ready to be worked upon
                  "RESEARCH"                  ;; Gather information.

                  "PREPARATION"               ;; Setup necessary resources, environments, tools for development.
                  "REQUIREMENT"               ;; Defining and clarifying the specific requirements & specification for the feature.

                  "EXECUTION"                 ;; Signifies tasks that are actively worked upon
                  "DEVELOPMENT"               ;; Represents tasks relating to coding, building, creating the project or feature.
                  "TESTING"                   ;; Verifing & validatig the functionality and quality of the developed feature.

                  "BUG(b)"                    ;; Bugs Bugs Bugs, Bugs are attracted to blue lights and I use citylights theme.

                  "REVIEW"                    ;; Undergoing evaluation or scrutiny to ensure the requirements are met.
                  "FEEDBACK"                  ;; Provides mechanism for collecting input, suggestions, criticisms.

                  "REVISION"                  ;; Tasks that requires modification, updates, corrections based on feedbacks.
                  "ADJUSTMENTS"               ;; Minor tweaks or alteration to the projects or feature to enchance functionality.

                  "DOCUMENTING"               ;; Documentation the feature, process, feedback , if cancelled why, if done what time frame.

                  "|"

                  "DONE"                      ;; Completed, reviewed, meet the criteria as per the documentation.
                  "BLOCKED"                   ;; Items which got blocked due to some situations.
                  "NEEDRESOLUTION"            ;; Further discussion or decision making to determine the course of action.
                  "CANCELLED"                 ;; For whatever reason it got cancelled.
                  )))


;; Will need to make decision or will just put at top.
;; Why is it here, have to add colors to the keyword faces.
(defvar citylights-fg                "#b7c5d3")
(defvar citylights-d-fg              "#9AAEC1")
(defvar citylights-b-grey            "#52616f")
(defvar citylights-grey              "#41505e")
(defvar citylights-d-grey            "#2a343c")
(defvar citylights-dd-grey           "#192631")
(defvar citylights-d-black           "#000000")
(defvar citylights-bg                "#1D252C")
(defvar citylights-black             "#10151c")
(defvar citylights-red               "#d95468")
(defvar citylights-error             "#e27e8d")
(defvar citylights-magenta           "#b62d65")
      ;; (citylights-orange         "#d98e48")
(defvar citylights-orange            "#e3ac78")
      ;; (citylights-orange         "#e0a167")
(defvar citylights-yellow            "#ebbf83")
(defvar citylights-green             "#8bd49c")
(defvar citylights-b-green           "#98fb98")
(defvar citylights-teal              "#33ced8")
(defvar citylights-cyan              "#22c7d3")
      ;; (citylights-cyan           "#70e1e8")
(defvar citylights-water             "#5ec4ff")
(defvar citylights-blue              "#539afc")
(defvar citylights-violet            "#6a5acd")


(setq org-todo-keyword-faces
	  `(    ("LEARN"                      . ,citylights-yellow)     ;; Currently studying the topic and making physical or digital notes.
		("STUDY-BOOK"                 . ,citylights-green)

	        ("UNDERWAY"                   . ,citylights-blue)       ;; Indicates tasks or topics that are actively studying or working on.
		("FOCUS"                      . ,citylights-blue)       ;; Signifies tasks or topics that require focused attention.

		("REVISIT"                    . ,citylights-cyan)       ;; Topics that need to be revist to understand better.
	        ;; ("SEEK-FEEDBACK")                                  ;; Topics that need to be asked to peers, teachers, metors.

	        ("CRE-CHEATSHEET"             . ,citylights-water)      ;; Creating cheatsheet (a way to summerise and easy searchable note) physically.
	        ;; ("CRE-DIGI-CHEATSHEET")                              ;; Create cheatsheet digitally throught latex

	        ("MASTERED"                   . ,citylights-grey)     ;; When the topic complete.

                ( "BACKLOG"                   . ,citylights-violet)     ;; Featues, fix that need to be implemented but which are not in priority
                ( "IDEA"                      . ,citylights-violet)     ;; Space for capture new concepts, suggestions, improvements

                ;; ( "PLANNING"         ;; Items which are ready to be worked upon
                ;; ( "RESEARCH"         ;; Gather information.

                ;; ( "PREPARATION"      ;; Setup necessary resources, environments, tools for development.
                ;; ( "REQUIREMENT"      ;; Defining and clarifying the specific requirements & specification for the feature.

                ;; ( "EXECUTION"        ;; Signifies tasks that are actively worked upon
                ;; ( "DEVELOPMENT"      ;; Represents tasks relating to coding, building, creating the project or feature.
                ;; ( "TESTING"          ;; Verifing & validatig the functionality and quality of the developed feature.

                ( "BUG"                      . ,citylights-error)       ;; Bugs Bugs Bugs, Bugs are attracted to blue lights and I use citylights theme.

                ;; ( "REVIEW"           ;; Undergoing evaluation or scrutiny to ensure the requirements are met.
                ;; ( "FEEDBACK"         ;; Provides mechanism for collecting input, suggestions, criticisms.

                ;; ( "REVISION"         ;; Tasks that requires modification, updates, corrections based on feedbacks.
                ;; ( "ADJUSTMENTS"      ;; Minor tweaks or alteration to the projects or feature to enchance functionality.

                ( "DOCUMENTING"              . ,citylights-blue)        ;; Documentation the feature, process, feedback , if cancelled why, if done what time frame.

		( "ACTIVE"                   . ,citylights-green)

                ( "DONE"                     . ,citylights-grey)        ;; Completed, reviewed, meet the criteria as per the documentation.
                ( "BLOCKED"                  . ,citylights-error)       ;; Items which got blocked due to some situations.
                ( "NEEDRESOLUTION"           . ,citylights-violet)      ;; Further discussion or decision making to determine the course of action.
                ( "CANCELLED"                . ,citylights-red)         ;; For whatever reason it got cancelled.
	        ( "HOLD"                     . ,citylights-violet)
		  ))

;; Org babel adds support for executing code
;;   inside code blocks in org mode
(org-babel-do-load-languages
 'org-babel-load-languages '((shell . t)))






;; ---org/indetation  ---  O R G  I N D E N T A T I O N



;; Per file basic indent or not
;; #+STARTUP: indent
;; #+STARTUP: noindent

;; Start org-indent-mode at startup
;; (setq org-startup-indentd t)

;; Text line that are not headlines are indented.
;; Its also solves the problem of, indentation of line wrapping.
;; So just by enabling org-adapt-indentaiton, the long line which
;;   are trunacated to next line will start from the left most side
;;   without indent which just looks like beauty and the beast.
;;   Enabling org-indent-mode solves this problem.
;; It also solve problem of "why do I have to backspace to enter new headline"
;;   So when having indent headline, pressing enter will get to new line
;;     but when enter *** for headline, it will not register it.
;;     So, either we have to press C+enter or backspace to first coloum to
;;     again enter the stars.
;; Ref - https://orgmode.org/manual/Org-Indent-Mode.html
(setq org-startup-indented t)

(setq org-indent-indentation-per-level 4)

(setq org-indent-mode-turns-off-org-adapt-indentation nil)

;; Difference between 'org-indent-mode' & 'org-adapt-indentation'
;; 'org-adapt-indentation' uses hard spaces, this will make the indent look outside
;;    the emacs too but not exactly like one ot two spaces.

;; Indentation in org mode READ the variable doc.
(setq org-adapt-indentation t) 

;; The whole indentation is pretty bad. Now every nest heading content shift by one char
;; Why - cause every heading the stars are increases by 1.
;; So the indented content code actually increases te content shift by 1 char by every nested heading.
;; I guess this code problem and cannot be solved easily.






;; ---org/supportpackages  ---  O R G  S U P P O R T  P A C K A G E S



(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; Modifies the headline
(use-package org-superstar
  :config
  ;; (setq org-superstar-leading-bullet "|")
  ;; Can also add more items to the below headline list to make headline cycle to them
  (setq org-superstar-headline-bullets-list "|" )
  ;; Changes the items icon differnt
  (setq org-superstar-prettify-item-bullets nil)
  ;; I don't know what below does
  ;; (setq org-superstar-special-todo-items t) ;; Makes TODO header bullets into boxes
  ;; (setq org-superstar-todo-bullet-alist '(("TODO" . 9744)
  ;;                                         ("INPROG-TODO" . 9744)
  ;;                                         ("WORK" . 9744)
  ;;                                         ("STUDY" . 9744)
  ;;                                         ("SOMEDAY" . 9744)
  ;;                                         ("READ" . 9744)
  ;;                                         ("PROJ" . 9744)
  ;;                                         ("CONTACT" . 9744)
  ;;                                         ("DONE" . 9745)))
  :hook (org-mode . org-superstar-mode))

;; When editing markup file, its hard to edit marked up element if when we made it hidden
;;   by 'org-hide-emphasis-markers', so this pkg will unhide the markup when the cursor
;;   is on that line and hides it back when cursor leave.
;; Ref - https://github.com/awth13/org-appear
(use-package org-appear
  :hook (org-mode . org-appear-mode))

;; Have to press M-Enter to get the auto generate list item markup
;; It makes it just Enter.
;; He explain it better - https://github.com/calvinwyoung/org-autolist , if your experience did not.
(use-package org-autolist
  :hook (org-mode . org-autolist-mode))

;; Changes org bullet in differnt style, other package can do the same
;; No need for this & by emacs does provide a fucntion to get the same feature
;; Ref - https://github.com/sabof/org-bullets
;; (use-package org-bullets
;;   :hook (org-mode. org-bullets-mode))

;; Make the looks different.
;; (use-package org-modern
;;   :hook (org-mode . org-modern-mode)
;;   :config
;;   (setq
;;    org-modern-star '("●" "○" "✸" "✿")
;;    ;; org-modern-star '( "⌾" "✸" "◈" "◇")
;;    org-modern-list '((42 . "◦") (43 . "•") (45 . "–"))
;;    org-modern-tag nil
;;    org-modern-priority nil
;;    org-modern-todo nil
;;    org-modern-table nil))

;; Does something cool but my knowledge is less at this time.
;; (use-package org-super-agenda
;;   :after org
;;   :config
;;   (setq org-super-agenda-header-map nil) ;; takes over 'j'
;;   ;; (setq org-super-agenda-header-prefix " ◦ ") ;; There are some unicode "THIN SPACE"s after the ◦
;;   ;; Hide the thin width char glyph. This is dramatic but lets me not be annoyed
;;   ;; (add-hook 'org-agenda-mode-hook
;;   ;;           #'(lambda () (setq-local nobreak-char-display nil)))
;;   (org-super-agenda-mode))

;; Have to learn how to use it effectivey
;; But it works like citation, like it creates a link to another note
;; (use-package org-ref
;;   :disabled ;; very slow to load
;;   :config (defalias 'dnd-unescape-uri 'dnd--unescape-uri))

;; Does something so complex that I am afraid
;; As a wise man said, "You are afraid of what you don't understand"
;; (use-package org-roam
;;   :bind
;;   (("C-c o r" . org-roam-capture)
;;    ("C-c o f" . org-roam-node-find))
;;   :custom
;;   (org-roam-directory (expand-file-name "~/Dropbox/txt/roam"))
;;   (org-roam-v2-ack t)
;;   :config
;;   (org-roam-db-autosync-mode))

;; (use-package org-journal
;;   :ensure t
;;   :defer t
;;   :init
;;   (setq org-journal-prefix-key "C-c j ")
;;   :config
;;   ;; (setq org-journal-dir "~/notes/journal/")
;;   (setq org-journal-file-type 'yearly)
;;   (setq	org-journal-date-format "%A, %d %B %Y")
;;   (setq org-journal-file-header "#+TITLE: Yearly Journal\n")
;;   ;; (add-to-list 'org-agenda-files org-journal-dir)
;;   (setq org-journal-enable-agenda-integration t))

;; (use-package auctex
;;   :ensure t
;;   :defer t
;;   )

(use-package pdf-tools
  :ensure t
  :defer t
  ;; stop pdf-tools being automatically updated when I update the
  ;; rest of my packages, since it would need the installation command and restart
  ;; each time it updated.
  :pin manual
  :mode  ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-loader-install)
  (setq-default pdf-view-display-size 'fit-height)
  (setq pdf-view-continuous nil) ;; Makes it so scrolling down to the bottom/top of a page doesn't switch to the next page
  (setq pdf-view-midnight-colors '("#ffffff" . "#121212" )) ;; I use midnight mode as dark mode, dark mode doesn't seem to work
  :general
  (general-define-key
   :states '(motion visual)
   :keymaps 'pdf-view-mode-map
                      "j" 'pdf-view-next-page
                      "k" 'pdf-view-previous-page

                      "C-j" 'pdf-view-next-line-or-next-page
                      "C-k" 'pdf-view-previous-line-or-previous-page

                      ;; Arrows for movement as well
                      (kbd "<down>") 'pdf-view-next-line-or-next-page
                      (kbd "<up>") 'pdf-view-previous-line-or-previous-page

                      (kbd "<down>") 'pdf-view-next-line-or-next-page
                      (kbd "<up>") 'pdf-view-previous-line-or-previous-page

                      (kbd "<left>") 'image-backward-hscroll
                      (kbd "<right>") 'image-forward-hscroll

                      "H" 'pdf-view-fit-height-to-window
                      "0" 'pdf-view-fit-height-to-window
                      "W" 'pdf-view-fit-width-to-window
                      "=" 'pdf-view-enlarge
                      "-" 'pdf-view-shrink

                      "q" 'quit-window
                      "Q" 'kill-this-buffer
                      "g" 'revert-buffer

                      "C-s" 'isearch-forward
                      )
  )

;; Make it possible to take notes side by side a pdf with link.
(use-package org-noter
  :ensure t
  :defer t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (setq org-noter-set-start-location t)
  (setq org-noter-enable-update-renames t)
  (setq org-noter-always-create-frame nil)
  )

;; Calendar view for agenda
(use-package calfw
  :ensure t
  )

;; Need to add more configuration to make google calendar sync.
;; (use-package emacs-request
;;   :ensure t
;;   :defer t)
;; (use-package alert
;;   :ensure t
;;   :defer t)
;; (use-package emacs-aio
;;   :ensure t
;;   :defer t)
;; (use-package emacs-oauth2-auto
;;   :ensure t
;;   :defer t)
;; (use-package org-gcal
;;   :ensure t
;;   :defer t)






;; ---keybindings  K E Y  B I N D I N G S






;; ---key/whichkey  ---  W H I C H  K E Y



;; Which-key provides next key available suggestion using minibuffer
;; If user want to get help press C-h then C-v to get option for varibale defination
;; This extra key pressing is substitue by C-h-v
;; Ref - https://github.com/justbur/emacs-which-key
(use-package which-key
             ;; As we are using evil key bindings
             ;; its better to call it after the evil-leader key
             ;; :after evil-leader
             :ensure t
             :init
             (which-key-setup-minibuffer)
			 ;; Enabling this will open minibuffer after each eval-buffer command
             ;; (which-key-show-major-mode)
             :config
			 ;; Time after the suggestion show
             (setq which-key-idle-delay 0.3)
             ;; String to include before a expandable command
             ;; default is " + "
             ;; (setq which-key-prefix-prefix "◉")
             ;; Order the list of available key alaphabetic wise,
             ;; but more option is available
             (setq which-key-sort-order 'which-key-key-order-alpha)
             (setq which-key-min-display-lines 3)
             (setq which-key-max-display-columns nil)
			 (setq which-key-add-column-padding 4)
			 (setq which-key-unicode-correction 3)
			 (setq which-key-max-description-length 20)
			 ;; (setq which-key-show-prefix 'top)
             (which-key-mode))






;; ---key/evil  ---  E V I L



;; Evil is 'Vim' keybindings for the 'eamcs'


;; Leader key is a key from which all key can be derived
;; Evil leader should be called before evil
;;   because if not, it will not work in initial buffers ( *scratch*, ...)
;;   Ref - https://github.com/emacs-evil/evil-collection/issues/215

;; Leader key based function is also available through 'evil',
;;   so there is no need to 'evil-leader' 
;; Currently using 'general'.

;; But I guess same fucntionality of grouping key binding under one leader key
;;   can be achieved through just 'evil' package.
;; Ref - https://evil.readthedocs.io/en/latest/keymaps.html#leader-keys
;; Some more configuration option
;; https://www.reddit.com/r/emacs/comments/12zyrnk/evilsetleader_vs_generalel_for_spc_based/

;; (use-package evil-leader
;;              :init
;;              (setq evil-want-keybinding nil)
;;              :config
;;              (global-evil-leader-mode)
;;              (evil-leader/set-leader "<SPC>")
;;              (evil-leader/set-key
;;                "b" 'switch-to-buffer
;;                "k" 'kill-buffer
;;                "e" '("eval" .(keymap))
;;                "eb" '("buffer" . eval-buffer)
;;                "er" '("region" . eval-region)))


;; I am vim.
(use-package evil
             :demand t
             :bind
             ;; Using esc key to exit any minibuffer
             ;; for which we have to press 3 times esc or kill the window
             (("<escape>" . keyboard-escape-quit))
             :init
             ;; don't load evil keybinding in other major modes
             (setq evil-want-keybinding nil)
			;; Whether actions are undone in several steps.
			;; There are two possible choices: nil ("no") means that all
			;; changes made during insert state, including a possible delete
			;; after a change operation, are collected in a single undo step.
			;; Non-nil ("yes") means that undo steps are determined according
			;; to Emacs heuristics, and no attempt is made to aggregate changes.
             (setq evil-want-fine-undo t)
             (setq evil-undo-system 'undo-fu)
            ;; Whether ‘Y’ yanks to the end of the line.
            ;; The default behavior is to yank the whole line, like Vim.
             (setq evil-want-Y-yank-to-eol t)
             ;; Allows for using cgn
			 ;; Search is not required, cause swiper is there to search the buffer
			 ;; Small line search is done through 'evil-snipe'
             ;; (setq evil-search-module 'evil-search)
             :config
             ;; Set the initial state for major mode MODE to STATE.
             ;; This is the state the buffer comes up in.
             (evil-set-initial-state 'dashboard-mode 'motion)
             ; ----- Setting cursor colors in differnt states
			 (setq evil-emacs-state-cursor    '("#539afc" box))
			 (setq evil-normal-state-cursor   '("#d95468" box))
			 (setq evil-operator-state-cursor '("#ebcb8b" hollow))
			 (setq evil-visual-state-cursor   '("#ebbf83" box))
			 (setq evil-insert-state-cursor   '("#eb998b" (bar . 2)))
			 (setq evil-replace-state-cursor  '("#eb998b" hbar))
			 (setq evil-motion-state-cursor   '("#d95468" box))
             (evil-mode 1))


;; Surround items in anything you type
;; In visual mode S<textobject> for total bracket, gS<textobject> for that region only
;; In normal mode ys<textobject> for total bracket, yS<textobject> for that region only
;; change a surrounding cs<old-textobject><new-textobject>
;; delete a surrounding ds<textobject>
;; Ref - https://github.com/emacs-evil/evil-surround
(use-package evil-surround
             :after evil
             :defer 2
             :config
             (global-evil-surround-mode 1))


;; 2 Char jump mode for quick movement in a line
;; s : forward snipe, S : backward snipe
;; TODO keybindings f/F : search repeat
;; TODO keybindings ;/, : repeating search
;; Some problem with magit buffer, if used read the readme
;; REf - https://github.com/hlissner/evil-snipe
(use-package evil-snipe
             :diminish evil-snipe-mode
             :diminish evil-snipe-local-mode
             :after evil
             :config
             (evil-snipe-mode 1)
			 (evil-snipe-override-mode 1)
			 (setq evil-snipe-scope 'whole-visible)
			 (setq evil-snipe-repeat-scope 'whole-visible))


;; Vim bindings everywhere else
;; The package helps you to have key binding every other application
;; (use-package evil-collection
;;              :after evil
;;              :config
;;              (setq evil-want-integration t)
;;             ;(setq evil-collection-mode-list '(dired (custom cus-edit) 
;;             ;;(package-menu package) calc diff-mode))
;;             (evil-collection-init))


;; gcc to comment a line
;; gc to comment a visully marked region
;; gcap to comment a paragraph
;; 3gcc commnets out 3 line
(use-package evil-commentary
             :after evil
             :config 
             (evil-commentary-mode))


;; Will work on it in future
;; (use-package org-evil)






;; ---key/general ---  G E N E R A L



;; General is enabled at top because :after keyword was working.


;; Some of the codes are commented out as its not required by me as of now
;;   but the way it is written, I may need to read the syntax to perform
;;   similar opertions. As I don't have any knowledge of 'general'





(general-define-key
 :states '(normal motion visual)
 :keymaps 'override
 :prefix "SPC"

 ;; Top level functions
 ; "/" '(jib/rg :which-key "ripgrep")
 ;; ";" '(spacemacs/deft :which-key "deft")
 ;; ":" '(project-find-file :which-key "p-find file")
 ;; "." '(counsel-find-file :which-key "find file")
 ;; "," '(counsel-recentf :which-key "recent files")
 "'" 'centaur-tabs-ace-jump
 ;; "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
 "SPC" '(counsel-M-x :which-key "Function")
 ;; "q" '(save-buffers-kill-terminal :which-key "quit emacs")
 ;; "r" '(jump-to-register :which-key "registers")
 "c" 'org-capture

 ;; "Applications"
"a" '(nil :which-key "applications")
"ao" '(org-agenda :which-key "org-agenda")
;; "am" '(mu4e :which-key "mu4e")
"aC" '(calc :which-key "calc")
"ac" '(org-capture :which-key "org-capture")
;; "aqq" '(org-ql-view :which-key "org-ql-view")
"aqs" '(org-ql-search :which-key "org-ql-search")

;; ;; "ab" '(nil :which-key "browse url")
;; ;; "abf" '(browse-url-firefox :which-key "firefox")
;; ;; "abc" '(browse-url-chrome :which-key "chrome")
;; ;; "abx" '(xwidget-webkit-browse-url :which-key "xwidget")
;; ;; ; "abg" '(jib/er-google :which-key "google search")

"ad" '(dired :which-key "dired")

;; Buffers
"b" '(nil :which-key "buffer")
"bb" '(counsel-switch-buffer :which-key "switch buffers")
"bd" '(evil-delete-buffer :which-key "delete buffer")
;; "bs" '(jib/switch-to-scratch-buffer :which-key "scratch buffer")
;; "bm" '(jib/kill-other-buffers :which-key "kill other buffers")
;; "bi" '(clone-indirect-buffer  :which-key "indirect buffer")
;; "br" '(revert-buffer :which-key "revert buffer")

;; Files
"f" '(nil :which-key "files")
"fb" '(counsel-bookmark :which-key "bookmarks")
"ff" '(counsel-find-file :which-key "find file")
"fn" '(evil-buffer-new :which-key "new file")
"fr" '(counsel-recentf :which-key "recent files")
"fR" '(rename-file :which-key "rename file")
"fs" '(save-buffer :which-key "save buffer")
"fS" '(evil-write-all :which-key "save all buffers")
"fo" '(reveal-in-osx-finder :which-key "reveal in finder")
;; "fO" '(jib/open-buffer-file-mac :which-key "open buffer file")

;; Help/emacs
"h" '(nil :which-key "help/emacs")
"hv" '(counsel-describe-variable :which-key "des. variable")
"hb" '(counsel-descbinds :which-key "des. bindings")
"hM" '(describe-mode :which-key "des. mode")
"hf" '(counsel-describe-function :which-key "des. func")
"hF" '(counsel-describe-face :which-key "des. face")
"hk" '(describe-key :which-key "des. key")
"hed" '((lambda () (interactive) (jump-to-register 67)) :which-key "edit dotfile")
"hm" '(nil :which-key "switch mode")
"hme" '(emacs-lisp-mode :which-key "elisp mode")
"hmo" '(org-mode :which-key "org mode")
"hmt" '(text-mode :which-key "text mode")
"hp" '(nil :which-key "packages")
"hpr" 'package-refresh-contents
"hpi" 'package-install
"hpd" 'package-delete

;; Toggles
"t" '(nil :which-key "toggles")
"tt" '(toggle-truncate-lines :which-key "truncate lines")
"tv" '(visual-line-mode :which-key "visual line mode")
"tn" '(display-line-numbers-mode :which-key "display line numbers")
;; "ta" '(mixed-pitch-mode :which-key "variable pitch mode")
"ty" '(counsel-load-theme :which-key "load theme")
"tw" '(writeroom-mode :which-key "writeroom-mode")
"tR" '(read-only-mode :which-key "read only mode")
"tI" '(toggle-input-method :which-key "toggle input method")
"tr" '(display-fill-column-indicator-mode :which-key "fill column indicator")
"tm" '(hide-mode-line-mode :which-key "hide modeline mode")

;; Windows
"w" '(nil :which-key "window")
;; "wm" '(jib/toggle-maximize-buffer :which-key "maximize buffer")
"wN" '(make-frame :which-key "make frame")
"wd" '(evil-window-delete :which-key "delete window")
"wc" '(evil-window-delete :which-key "delete window")
"w-" '(lambda () (interactive) (split-window-vertically) (other-window 1) :which-key "split below")
"w/" '(lambda () (interactive) (split-window-horizontally) (other-window 1) :which-key "split right")
"wr" '(hydra-window/body :which-key "hydra window")
"wl" '(evil-window-right :which-key "evil-window-right")
"wh" '(evil-window-left :which-key "evil-window-left")
"wj" '(evil-window-down :which-key "evil-window-down")
"wk" '(evil-window-up :which-key "evil-window-up")
"wz" '(text-scale-adjust :which-key "text zoom")
) ;; End SPC prefix block


;; Non-insert mode keymaps
(general-def
  :states '(normal visual motion)
  "gc" 'comment-dwim
  "gC" 'comment-line

  "u" 'undo-fu-only-undo
  "U" 'undo-fu-only-redo

  "j" 'evil-next-visual-line 
  "k" 'evil-previous-visual-line 

  ;; "gf" 'xah-open-file-at-cursor
  ;; "f" 'evil-avy-goto-char-in-line

  "=" '(lambda () (interactive) (split-window-horizontally) (other-window 1))
  "-" '(lambda () (interactive) (split-window-vertically ) (other-window 1)) 

  ;; "\\" '(lambda () (interactive) (org-agenda nil "c"))
  ;; "|" '(lambda () (interactive) (org-ql-view "Columbia Todo"))
  ;; "]\\" '(lambda () (interactive) (org-agenda nil "w"))
  )

(general-def
  :states '(normal visual motion)
  :keymaps 'override
  "/" 'swiper
  "?" 'evil-search-forward
  "'" 'perspective-map
  )

;; Insert keymaps
;; Many of these are emulating standard Emacs bindings in Evil insert mode, such as C-a, or C-e.
(general-def
  :states '(insert)
  "C-a" 'evil-beginning-of-visual-line
  "C-e" 'evil-end-of-visual-line
  "C-S-a" 'evil-beginning-of-line
  "C-S-e" 'evil-end-of-line
  "C-n" 'evil-next-visual-line
  "C-p" 'evil-previous-visual-line
  )

(general-def
 :keymaps 'emacs
  "C-w C-q" 'kill-this-buffer
 )


;; Hydra solves the problem of 
;; " I don't want to repeat the whole combination
;; of commands to just press the same letter again"
(use-package hydra 
             :defer t)

; (defhydra hydra-zoom
;           ("g" text-scale-increase "in")
;           ("l" text-scale-decrease "out"))


;; This Hydra lets me swich between variable pitch fonts.
;; (defhydra jb-hydra-variable-fonts (:pre (mixed-pitch-mode 0)
;;                                      :post (mixed-pitch-mode 1))
;;   ("t" (set-face-attribute 'variable-pitch nil :family "Times New Roman" :height 160) "Times New Roman")
;;   ("g" (set-face-attribute 'variable-pitch nil :family "EB Garamond" :height 160 :weight 'normal) "EB Garamond")
;;   ("n" (set-face-attribute 'variable-pitch nil :slant 'normal :weight 'normal :height 160 :width 'normal :foundry "nil" :family "Nunito") "Nunito")
;;   )

;; ; (defhydra jb-hydra-theme-switcher (:hint nil)
;; ;   "
;; ;      Dark                ^Light^
;; ; ----------------------------------------------
;; ; _1_ one              _z_ one-light
;; ; _2_ vivendi          _x_ operandi
;; ; _3_ molokai          _c_ jake-plain
;; ; _4_ snazzy           _v_ flatwhite
;; ; _5_ old-hope         _b_ tomorrow-day
;; ; _6_ henna                ^
;; ; _7_ kaolin-galaxy        ^
;; ; _8_ peacock              ^
;; ; _9_ jake-plain-dark      ^
;; ; _0_ monokai-machine      ^
;; ; _-_ xcode                ^
;; ; _q_ quit                 ^
;; ; ^                        ^
;; ; "

;;   ; ;; Dark
;;   ; ("1" (jib/load-theme 'doom-one)				 "one")
;;   ; ("2" (jib/load-theme 'modus-vivendi)			 "modus-vivendi")
;;   ; ("3" (jib/load-theme 'doom-molokai)			 "molokai")
;;   ; ("4" (jib/load-theme 'doom-snazzy)			 "snazzy")
;;   ; ("5" (jib/load-theme 'doom-old-hope)			 "old-hope")
;;   ; ("6" (jib/load-theme 'doom-henna)				 "henna")
;;   ; ("7" (jib/load-theme 'kaolin-galaxy)			 "kaolin-galaxy")
;;   ; ("8" (jib/load-theme 'doom-peacock)			 "peacock")
;;   ; ("9" (jib/load-theme 'jake-doom-plain-dark)	 "jake-plain-dark")
;;   ; ("0" (jib/load-theme 'doom-monokai-machine)	 "monokai-machine")
;;   ; ("-" (jib/load-theme 'doom-xcode)				 "xcode")

;;   ; ;; Light
;;   ; ("z" (jib/load-theme 'doom-one-light)			 "one-light")
;;   ; ("x" (jib/load-theme 'modus-operandi)			 "modus-operandi")
;;   ; ("c" (jib/load-theme 'jake-doom-plain)		 "jake-plain")
;;   ; ("v" (jib/load-theme 'doom-flatwhite)			 "flatwhite")
;;   ; ("b" (jib/load-theme 'doom-opera-light)		 "tomorrow-day")
;;   ; ("q" nil))

;; ;; I think I need to initialize windresize to use its commands
;; ;;(windresize)
;; ;;(windresize-exit)

;; ;;(require 'windresize)

;; All-in-one window managment. Makes use of some custom functions,
;; `ace-window' (for swapping), `windmove' (could probably be replaced
;; by evil?) and `windresize'.
;; inspired by https://github.com/jmercouris/configuration/blob/master/.emacs.d/hydra.el#L86

(defhydra hydra-window (:hint nil)
   "
Movement      ^Split^            ^Switch^        ^Resize^
----------------------------------------------------------------
_M-h_left   _/_ vertical      _b_uffer        _<left>_  <
_M-l_right   _-_ horizontal    _f_ind file     _<down>_  ↓
_M-k_up    k   _m_aximize        _s_wap          _<up>_    ↑
_M-j_down  h   _c_lose           _[_backward     _<right>_ >
_q_uit          _e_qualize        _]_forward     ^
^               ^               _K_ill         ^
^               ^                  ^             ^
"
   ;; Movement
   ("M-h" windmove-left)
   ("M-j" windmove-down)
   ("M-k" windmove-up)
   ("M-l" windmove-right)

   ;; Split/manage
   ("-" split-window-vertically)
   ("/" split-window-horizontally)
   ("c" evil-window-delete)
   ("d" evil-window-delete)
   ("m" delete-other-windows)
   ("e" balance-windows)

   ;; Switch
   ("b" counsel-switch-buffer)
   ("f" counsel-find-file)
   ("P" project-find-file)
   ("s" ace-swap-window)
   ("[" previous-buffer)
   ("]" next-buffer)
   ("K" kill-this-buffer)

   ;; Resize
   ("<left>" windresize-left)
   ("<right>" windresize-right)
   ("<down>" windresize-down)
   ("<up>" windresize-up)

   ("q" quit)
   )

;; (defhydra jb-hydra-org-table ()
;;   "
;; _c_ insert col    _v_ delete col    Move col: _h_, _l_
;; _r_ insert row    _d_ delete row    Move row: _j_, _k_
;; _n_ create table  _i_ create hline
;; _u_ undo
;; _q_ quit

;; "
;;   ("n" org-table-create "create table")
;;   ("c" org-table-insert-column "insert col")
;;   ("r" org-table-insert-row "insert row")
;;   ("v" org-table-delete-column "delete col")
;;   ("d" org-table-kill-row "delete row")
;;   ("i" org-table-insert-hline "hline")

;;   ("u" undo-fu-only-undo "undo")

;;   ("h" org-table-move-column-left "move col left")
;;   ("l" org-table-move-column-right "move col right")
;;   ("k" org-table-move-row-up "move row up")
;;   ("j" org-table-move-row-down "move row down")

;;   ("<left>" org-table-previous-field)
;;   ("<right>" org-table-next-field)
;;   ("<up>" previous-line)
;;   ("<down>" org-table-next-row)

;;   ("q" nil "quit"))


;; If key don't work after eval-region , then emacs-restart. Why
(general-define-key
 :prefix ","
 :states '(normal motion visual)
 :keymaps '(org-mode-map)
 "" nil
 ;; "A" '(org-archive-subtree-default :which-key "org-archive")
 "a" '(org-agenda :which-key "org agenda")
 ;; "6" '(org-sort :which-key "sort")
 "c" '(org-capture :which-key "org-capture")
 "s" '(org-schedule :which-key "schedule")
 ;; "S" '(jib/org-schedule-tomorrow :which-key "schedule tmrw")
 "d" '(org-deadline :which-key "deadline")
 "g" '(counsel-org-goto :which-key "goto heading")
 "t" '(counsel-org-tag :which-key "set tags")
 "p" '(org-set-property :which-key "set property")
 ;; "r" '(jib/org-refile-this-file :which-key "refile in file")
 "e" '(org-export-dispatch :which-key "export org")
 ;; "," '(jib/org-set-startup-visibility :which-key "startup visibility")
 "." '(org-toggle-narrow-to-subtree :which-key "toggle narrow to subtree")
 "H" '(org-html-convert-region-to-html :which-key "convert region to html")
 ;; "C" '(jib/org-copy-link-to-clipboard :which-key "copy link to clipboard")
 ;; "=" '(ap/org-count-words :which-key "ap/org-count-words")

 "1" '(org-toggle-link-display :which-key "toggle link display")
 "2" '(org-toggle-inline-images :which-key "toggle images")
 ;; "3" '(jib/org-occur-unchecked-boxes :which-key "occur unchecked boxes")

 "b" '(nil :which-key "babel")
 "bt" '(org-babel-tangle :which-key "org-babel-tangle")
 "bb" '(org-edit-special :which-key "org-edit-special")
 "bc" '(org-edit-src-abort :which-key "org-edit-src-abort")
 "bk" '(org-babel-remove-result-one-or-many :which-key "org-babel-remove-result-one-or-many")

 ;; "x" '(nil :which-key "text")
 ;; "xb" (spacemacs|org-emphasize spacemacs|org-bold ?*)
 ;; "xb" (spacemacs|org-emphasize spacemacs|org-bold ?*)
 ;; "xc" (spacemacs|org-emphasize spacemacs|org-code ?~)
 ;; "xi" (spacemacs|org-emphasize spacemacs|org-italic ?/)
 ;; "xs" (spacemacs|org-emphasize spacemacs|org-strike-through ?+)
 ;; "xu" (spacemacs|org-emphasize spacemacs|org-underline ?_)
 ;; "xv" (spacemacs|org-emphasize spacemacs|org-verbose ?~) ;; I realized that ~~ is the same and better than == (Github won't do ==)

 ;; insert
 "i" '(nil :which-key "insert")

 "il" '(org-insert-link :which-key "org-insert-link")
 "l" '(org-insert-link :which-key "org-insert-link") ;; More convenient access
 "iL" '(counsel-org-link :which-key "counsel-org-link")
 ;; "it" '(jb-hydra-org-table/body :which-key "tables")

 "is" '(nil :which-key "insert stamp")
 "iss" '((lambda () (interactive) (call-interactively (org-time-stamp-inactive))) :which-key "org-time-stamp-inactive")
 "isS" '((lambda () (interactive) (call-interactively (org-time-stamp nil))) :which-key "org-time-stamp")

 ;; clocking
 "c" '(nil :which-key "clocking")
 "ci" '(org-clock-in :which-key "clock in")
 "co" '(org-clock-out :which-key "clock out")
 "cj" '(org-clock-goto :which-key "jump to clock")

 )






;; ---webdev  W E B  D E V



(use-package web-mode
  :ensure t
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode)) ;; Open .html files in web-mode
  (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode)) ;; Open .html files in web-mode
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode)) ;; Open .html files in web-mode
  :config
  (setq web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight t)
  :general
  (general-def
  :prefix ","
  :states 'motion
  :keymaps 'web-mode-map
  "" nil
  "i" '(web-mode-buffer-indent :which-key "web mode indent")
  "c" '(web-mode-fold-or-unfold :which-key "web mode toggle fold")
  ))






;; ---web/vue  ---  V U E



(use-package vue-mode
  :ensure t
  :defer t
  :config
  ;; disables the ugly background
  (add-hook 'mmm-mode-hook
			(lambda ()
			  (set-face-background 'mmm-default-submode-face nil))))

(add-to-list 'load-path "~/.emacs.d/cstm-package-repo/lsp-bridge/")


;; Required by lsp-bridge
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; Provides snippet for the yasnippet
;; List of snippets available M-x yas-describe-table
(use-package yasnippet-snippets
  :ensure t)

;; required by lsp-bridge
(use-package markdown-mode
  :ensure t)


;; Lsp bridge is an async language-server and alternative to the lsp-mode & eglot.
;; Language-server installed
;;   - '@vue/language-server' :: vue :: https://www.npmjs.com/package/@vue/language-server
;;     - installed 'markdown-mode' is the requirement.
;;     - installed bunch of python packages, some are from pacman & aur repo.
;;     - a mode is also required by the server which here it is using 'web-mode'
;; Ref - https://github.com/manateelazycat/lsp-bridge?tab=readme-ov-file
;; (require 'lsp-bridge)
;; (setq acm-enable-quick-access t)
;; (global-lsp-bridge-mode)
;; lsp-bridge is causing emacs to crash unexpectedly.


;; Perspective is not good as I thought, and need more modification.
(use-package perspective
  :ensure t
  :bind
  ("C-x C-b" . persp-list-buffers)
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))
  :init
  (persp-mode)
  :config
  (setq persp-state-default-file "~/.perspective-default-state-save-file")
  (add-hook 'kill-emacs-hook #'persp-state-save)
  )
 
;; (defun my-handle-error-advice (orig-fun &rest args)
;;   "Advice function to save backtrace when an error occurs."
;;   (condition-case err
;;       (apply orig-fun args)
;;     (error
;;      (with-temp-file "~/emacs-error.log"
;;        (insert (format "Error occurred: %s\n" err))
;;        (insert (format "Backtrace:\n%s\n" (with-output-to-string (backtrace))))
;;        (insert (format "Arguments: %S\n" args))))
;;     (signal (car err) (cdr err))))

;; (advice-add 'handle-error :around #'my-handle-error-advice)

(use-package json-mode
  :ensure t
  :defer t)





;; Do you get hugs at night or tears swallow you up.
;; ---end  E N D
