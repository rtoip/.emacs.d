# TODO

    -[ ] check out MELPA
    -[X] figure out how to archive things
    -[ ] plunder https://github.com/psmith1303/emacsd/blob/master/psmith.org
    -[ ] explore how well Emacs notes work with inline images and a corresponding capture functionality
    -[ ] make DEADLINE listings in agenda mode disappear when items have been scheduled. Note: Tried, did not work.
    -[ ] check out advanced autocompletion packages e.g. Helm. Currently *ido-mode* is used. 


## MELPA

Might be an interesting tool

    ;; If you don't have MELPA in your package archives:
    (require 'package)
    (add-to-list
    'package-archives
    '("melpa" . "http://melpa.org/packages/") t)
    (package-initialize)
    (package-refresh-contents)
