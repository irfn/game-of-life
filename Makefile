generate: deps
	@find src -name '*.coffee' | xargs coffee --join lib/gameoflife.js --compile

clean:
	@rm -f lib/gameoflife.js

deps:
	@test `which coffee` || echo 'You need to have CoffeeScript in your PATH.\nPlease install it using  `npm install -g coffee-script`.'

default: generate
