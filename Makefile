EMACS=/Volumes/Data/emacs
DOCS=lispintro/emacs-lisp-intro.mobi lispref/elisp.mobi emacs/emacs.mobi misc/gnus.mobi misc/tramp.mobi misc/calc.mobi misc/org.mobi 

all: docs

docs: ${DOCS}

clean:
	rm *.mobi

%.html:
	mkdir -p $(@D)
	cp ${EMACS}/doc/$@ $(@D) 

%.mobi: %.html
	ebook-convert $< .mobi --language=en --authors="GNU Emacs"
	mv $(@F) $(@D)

