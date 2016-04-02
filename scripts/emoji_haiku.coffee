fs = require 'fs'

module.exports = (robot) ->
  emoji = require '../emojis.json'

  genEmoji = ->
    return emoji[Math.floor(Math.random() * emoji.length)]

  robot.hear /emoji haiku/i, (msg) ->
    msgSend = []
    for num in [1..3]
      msgSend.push genEmoji()
    msg.send msgSend.join ' '
