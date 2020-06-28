;;;; my init file
;;;; Author: Alistair Y. Lewars

;;; package setup
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

;; disable hard tabs.
(setq-default indent-tabs-mode nil)
(defun my-c-mode-hook ()
  (setq indent-tabs-mode nil))

(add-hook 'c-mode-hook 'my-c-mode-hook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-image-file-mode t)
 '(blink-matching-paren t)
 '(column-number-mode 1)
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(frame-background-mode nil)
 '(ido-mode (quote both) nil (ido))
 '(image-file-name-extensions
   (quote
    ("png" "jpeg" "jpg" "gif" "tiff" "tif" "xbm" "xpm" "pbm" "pgm" "ppm" "pnm")))
 '(imagemagick-enabled-types
   (quote
    (3FR ARW AVS BMP BMP2 BMP3 CAL CALS CMYK CMYKA CR2 CRW CUR CUT DCM DCR DCX DDS DJVU DNG DPX EXR FAX FITS GBR GIF GIF87 GRB HRZ ICB ICO ICON J2C JNG JP2 JPC JPEG JPG JPX K25 KDC MIFF MNG MRW MSL MTV NEF ORF OTB PBM PCD PCDS PCL PCT PCX PDB PEF PGM PICT PIX PJPEG PNG PNG24 PNG32 PNG8 PNM PPM PSD PTIF PWP RAF RAS RBG RGB RGBA RGBO RLA RLE SCR SCT SFW SGI SR2 SRF SUN TGA TIFF TIFF64 TILE TIM TTF UYVY VDA VICAR VID VIFF VST WBMP WPG X3F XBM XC XCF XPM XV XWD YCbCr YCbCrA YUV)))
 '(imagemagick-types-inhibit (quote (C HTML HTM INFO M TXT PDF SVG)))
 '(imenu-auto-rescan t)
 '(iswitchb-buffer-ignore (quote ("^ " "*Buffer")))
 '(iswitchb-mode nil)
 '(iswitchb-use-frame-buffer-list nil)
 '(org-agenda-files (quote ("~/tmp/outline.txt")))
 '(package-selected-packages
   (quote
    (jedi jedi-core jedi-direx impatient-mode company-web lorem-ipsum web-mode skewer-mode yaml-mode groovy-mode anaconda-mode json-mode magit gitignore-mode browse-at-remote git-ps1-mode gitconfig-mode ibuffer-git rpm-spec-mode emojify tangotango-theme solarized-theme edit-server)))
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

;; auto-complete
(setq ac-auto-start t)
(setq ac-use-menu-map t)

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

;; ;;; theme
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
;;; web-mode
(require 'web-mode)

(setq web-mode-engines-alist '(("django"    . "\\.html\\'")))
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-quoting t)
(setq web-mode-enable-auto-opening t)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-indentation t)
(setq web-mode-enable-auto-quoting t)

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(set-face-attribute 'web-mode-html-tag-face nil :foreground "#6dd6ff")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#e9b96d")
(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#a8f76a")
(add-hook 'web-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-css-property)))
;; -- functions --
