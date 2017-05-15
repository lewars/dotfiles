;;;; my init file

;;; package setup
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

;; --

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-matching-paren t)
 '(column-number-mode 1)
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(frame-background-mode nil)
 '(ido-mode (quote both) nil (ido))
 '(imenu-auto-rescan t)
 '(iswitchb-buffer-ignore (quote ("^ " "*Buffer")))
 '(iswitchb-mode nil)
 '(iswitchb-use-frame-buffer-list nil)
 '(org-agenda-files (quote ("~/tmp/outline.txt")))
 '(package-selected-packages
   (quote
    (magit gitignore-mode browse-at-remote git-ps1-mode gitconfig-mode ibuffer-git rpm-spec-mode emojify tangotango-theme solarized-theme jedi-direx edit-server)))
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil)
 '(which-function-mode 1)
 '(whitespace-style (quote (face trailing tabs spaces))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-only-match ((t (:foreground "SpringGreen3")))))

;; --

;;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(setq ibuffer-saved-filter-groups
      (quote (("default"
	       ("dired" (mode . dired-mode))
	       ("perl" (mode . cperl-mode))
	       ("perl" (mode . python-mode))
	       ("emacs" (or
			 (name . "^\\*scratch\\*$")
			 (name . "^\\*Messages\\*$")))
	       ("gnus" (or
			(mode . message-mode)
			(mode . bbdb-mode)
			(mode . mail-mode)
			(mode . gnus-group-mode)
			(mode . gnus-summary-mode)
			(mode . gnus-article-mode)
			(name . "^\\.bbdb$")
			(name . "^\\.newsrc-dribble")))))))

;;; theme
(load-theme 'tango-dark t)
(setq inhibit-startup-message t)
(setq display-time-day-and-date t)
(display-time-mode t)
(setq fill-column 79)
(setq auto-fill-mode t)

;;; keybindings
(global-set-key "\C-cw" 'whitespace-mode)
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; mighty mouse scroll
(setq mouse-wheel-scroll-amount '(0.01))

;; set key binding for ffap (find file at point)
(global-set-key (read-kbd-macro "C-x f") 'find-file-at-point)

;; ---

;;; eshell
(setq eshell-prompt-function
      (lambda ()
	(concat (if (= (user-uid) 0) " #" " $") "> ")))

;;; org mode
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "NEED-FEEDBACK" "DELEGATED" "WAITING" "|" "DONE" "CLOSED")))
(setq org-log-done 'time)
(setq org-log-done 'note)

;; ---

;;; Python
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;; Groovy
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

;; -- functions --
