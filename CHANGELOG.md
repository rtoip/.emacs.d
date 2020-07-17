# Changelog

Additions, removals, changes, fixes.

## version .7

* changed status: CANCELLED --> KILLED
* removed status DELEGATED
* added display of days consecutivly in the agenda
* removed some unused fonts
* added custom set variables: 
	* completed DEADLINES,SCHEDULED events are not displayed
	* agenda has 14 days
	* deadline has 14 warning days
	* agenda starts on current day

## version .6 (2020-06-30)

* Added image display toggle

* Cut various commented stuff: 

	;; unused fonts
	;(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 120)
	;(set-face-attribute 'default nil :family "Ubuntu Mono" :height 140)
	;(set-face-attribute 'default nil :family "Hack" :height 109) ; was 120

	;; Line-wrapping ON
	;(global-visual-line-mode 1)

## version .5 (2020-02-15)
* Added *hiding/showing* of emphasis markers

## version .4 (2019-11-08)
* Added F4 binding in order to switch line wrapping (using visual-line-mode instead of truncate-lines nil/t)

## version .3 (2019-06-01)
Just a checkpoint. Experimented with MELPA a bit. 

## version .2 (2019-04-06)

### Additions
* .gitignore

## version .1 (2019-03-25)

### Additions
* Quite a bunch of initial configuration declarations. 
