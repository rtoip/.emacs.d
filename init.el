;; -*- mode: elisp -*-


;;;; ------------------------- ;;;; 
;;;; Emacs basic configuration ;;;; 
;;;; ------------------------- ;;;; 

;; version .8

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

;; Hide emphasis markup 
(setq org-hide-emphasis-markers t)

;; Font
;(set-face-attribute 'default nil :family "Hack" :height 109) ; was 120
(set-face-attribute 'default nil :family "PragmataPro" :height 120)  

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
(global-set-key (kbd "<f4>") 'org-agenda)				         ; show org-agenda
(global-set-key (kbd "<f5>") 'visual-line-mode) 	       ; truncate-lines nil/t
(global-set-key (kbd "<f6>") 'org-toggle-inline-images)  ; display inline images
(global-set-key (kbd "<f7>") 'org-store-link)		         ; store link
(global-set-key (kbd "<f8>") 'calendar)		               ; show calendar
(global-set-key (kbd "<f9>") 'kill-buffer)			         ; kill current buffer/window


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
	("~/Documents/Org-mode-sync/active.org" "~/Documents/Org-mode-sync/financial.org" "~/Documents/Org-mode-sync/organisation.org" "~/Documents/Org-mode-sync/social.org" "~/Documents/Org-mode-sync/relationship.org" "~/Documents/Org-mode-sync/parenting.org" "~/Documents/Org-mode-sync/mind.org" "~/Documents/Org-mode-sync/health.org" "~/Documents/Org-mode-sync/habit.org" "~/Documents/Org-mode-sync/emotional.org" "~/Documents/Org-mode-sync/career.org" "~/Documents/org/resources.org")))
 '(org-agenda-ndays 14)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-capture-templates
   (quote
	(("n" "note" entry
	  (file
	   (concat org-directory "/journal.org"))
	  "* %?
%U
"))))
 '(org-deadline-warning-days 14)
 '(org-export-backends (quote (ascii html icalendar latex md org)))
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
             (sequence "WAITING(w)" "PENDING(p)" "|" "HOLD(h)" "KILLED(k)"))))

;; TODO tag color configuration
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "orange" :weight bold)
              ("ACTIVE" :foreground "red" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "magenta" :weight bold)
              ("PENDING" :foreground "blue" :weight bold)
              ("HOLD" :foreground "blue" :weight bold)
              ("KILLED" :foreground "gray" :weight bold))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; centralises the backup files filename# created during editing
; Note: testing this feature set
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )




;; -----------------------------------------------------------------
;; Helper functions
;; -----------------------------------------------------------------

; NOTE: These functions do not work as expected. 

;; recursive org-sort-entries
(defun sort-all-org-entries ()
  (interactive)
  (let ((fun #'(lambda nil
                 (condition-case nil
                     (org-sort-entries nil ?a)
                   (user-error t)))))
    (org-map-entries fun)))


(defun org-sort-buffer ()
  "Sort all entries in the current buffer, recursively."
  (interactive)
  (org-map-entries (lambda ()
                     (condition-case x
                         (org-sort-entries nil ?a)
                       (user-error)))))
