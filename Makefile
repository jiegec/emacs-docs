EMACS=/Volumes/Data/emacs
DOCS=lispintro/emacs-lisp-intro.doc lispref/elisp.doc emacs/emacs.doc misc/gnus.doc misc/tramp.doc misc/calc.doc misc/org.doc misc/cl.doc misc/info.doc misc/eshell.doc
LANGUAGE=en
AUTHORS="GNU Emacs"

all: docs

docs: ${DOCS}

clean:
	rm *.mobi

%.doc: %.html %.mobi
	touch $@

%.html:
	mkdir -p $(@D)
	cp ${EMACS}/doc/$@ $(@D) 

%.mobi: %.html
	ebook-convert $< .mobi --language=${LANGUAGE} --authors=${AUTHORS}
	mv $(@F) $(@D)

%.epub: %.html
	ebook-convert $< .epub --language=${LANGUAGE} --authors=${AUTHORS}
	mv $(@F) $(@D)

