.PHONY: docs

default:
	idris -p idrisscript -p html -p xhr -i src

deps:
	cd lib/IdrisScript;               \
	idris --install idrisscript.ipkg; \
	cd -;                             \
	cd lib/idris-xhr;                 \
	idris --install xhr.ipkg;         \
	cd -;                             \
	cd lib/idris-html;                \
	idris --install html.ipkg;        \
	cd -

docs:
	rm -rf docs;            \
	idris --mkdoc dom.ipkg; \
	mv dom_doc docs

test:
	idris --checkpkg dom.ipkg
