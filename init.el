;; -*- mode: elisp -*-


;;;; ------------------------- ;;;; 
;;;; Emacs basic configuration ;;;; 
;;;; ------------------------- ;;;; 

;; version .3

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;; set default tab char's display width to 4 spaces
(setq-default tab-width 4) ; emacs 23.1 to 26 default to 8

;; Switching on/off for menu bar, tool bar, and scrollbar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1) 
(blink-cursor-mode 0)
(column-number-mode 1)

;; Line-wrapping ON
;(global-visual-line-mode 1)

;; Font
;(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 120)
;(set-face-attribute 'default nil :family "Ubuntu Mono" :height 140)
(set-face-attribute 'default nil :family "Hack" :height 109) ; was 120

;; Answering yes and no to each question from Emacs can be tedious, a single y or n will suffice.
(fset 'yes-or-no-p 'y-or-n-p)

;; Set utf-8 as preferred coding system.
(set-language-environment "UTF-8")


;; Show matching parens e.g. for LISP
(show-paren-mode 1)

;; sentences end with single space
(setq sentence-end-double-space nil)


;;;; ---------------------- ;;;; 
;;;; Org-Mode configuration ;;;; 
;;;; ---------------------- ;;;; 

;; enable Org mode
(require 'org)

;; define the org-mode directory for .org files
;; Note that org-mode agenda files have been added manually with: C-c [
(setq org-directory "~/Documents/org")

;; Make Org mode work with files ending in .org
;; The code below is the default in recent emacsen
; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; use org-mode for .org and .org-archive files 
(add-to-list 'load-path (expand-file-name org-directory))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

;; add timestamp to task that are DONE
(setq org-log-done t)

;; Key bindings
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c b") 'org-iswitchb)
;; ...
(global-set-key (kbd "<f5>") 'org-agenda)
(global-set-key (kbd "<f6>") 'org-capture)
(global-set-key (kbd "<f7>") 'org-store-link)
(global-set-key (kbd "<f8>") 'calendar)
(global-set-key (kbd "<f9>") 'kill-buffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Documents/org/active.org")))
 '(org-capture-templates
   (quote
	(("n" "note" entry
	  (file
	   (concat org-directory "/journal.org"))
	  "* %?
%U
"))))
 '(package-selected-packages (quote (intero))))


;; Shorter route towards capturing notes
; define auxiliary function
(defun org-capture-mynote ()
  (interactive)
  "Capture a TODO item"
  (org-capture nil "n"))
; bind to hotkey
(global-set-key (kbd "<f12>") 'org-capture-mynote)

;; Make display of stars more clean and set '#+STARTUP: indent' globally
(setq org-hide-leading-stars t)
(setq org-startup-indented t)

;; Set one archive location for all .org files
(setq org-archive-location (concat org-directory "/archived.org::"))

;; Autocompletion
; Let us use ido-mode instead of Helm
; Helm seems to be more complex.
(ido-mode)
(setq org-completion-use-ido t)

;; TODO tag declaration
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "ACTIVE(a)" "|" "DONE(d)")
             (sequence "WAITING(w)" "HOLD(h)" "|" "CANCELLED(c)")
             (sequence "|" "DELEGATED(d)"))))

;; TODO tag color configuration
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "orange" :weight bold)
              ("ACTIVE" :foreground "red" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "magenta" :weight bold)
              ("HOLD" :foreground "blue" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
