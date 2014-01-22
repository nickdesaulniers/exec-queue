MAX_PROCS = 10
exec = require('child_process').exec
queue = []

nextInLine = ->
  #console.log 'queue length: ', queue.length
  if queue.length > 0
    exec.apply null, queue.shift()

module.exports = ->
  args = Array.prototype.slice.call arguments
  oldCb = args.pop()
  args.push ->
    oldCb.apply null, arguments
    nextInLine()
  queue.push args
  if queue.length < MAX_PROCS
    process.nextTick ->
      nextInLine()

