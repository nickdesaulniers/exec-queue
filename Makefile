default:
	coffee -c index.coffee

test:
	coffee test.coffee

clean:
	rm index.js
