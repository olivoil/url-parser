BUMP = ./node_modules/.bin/bump

test:
	@npm test

test-browserify:
	@npm run-script test-browserify

test-component:
	@npm run-script test-component

patch:
	${BUMP} patch

minor:
	${BUMP} minor

release: test
	VERSION=`node -p "require('./component.json').version"` && \
	git changelog --tag $$VERSION && \
	git release $$VERSION
	
.PHONY: test test-browserify test-component patch minor release
