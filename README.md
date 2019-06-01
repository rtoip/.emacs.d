# emacs-cfg
Simple emacs &amp; org-mode configuration directory *~/emacs.d*.

## Requirements: 

- Emacs (version in use: GNU Emacs 25.2.1) 
- the font face [Hack](https://github.com/source-foundry/Hack)

## Check out

- [ ] MELPA 

### MELPA

Might be an interesting tool

    ;; If you don't have MELPA in your package archives:
    (require 'package)
    (add-to-list
    'package-archives
    '("melpa" . "http://melpa.org/packages/") t)
    (package-initialize)
    (package-refresh-contents)
