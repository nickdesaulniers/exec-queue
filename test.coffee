exec = require './index.coffee'
for _ in [0...100]
  exec 'ls', (err, stdout, stderr) ->
    console.log stdout

