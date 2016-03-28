require './test_helper'
_ = require 'lodash'
co = require 'co'

describe 'emoji_haiku', ->
  beforeEach createRoom('../scripts/emoji_haiku.coffee')
  beforeEach ->
    co =>
      yield @room.user.say 'logan', 'hubot: emoji haiku'

  it 'responds to /emoji haiku/', ->
    messages = _(@room.messages)
    expect(messages.last()[0]).to.eql('hubot')
    expect(messages.last()[1]).to.match(/[\X\s]*/) # returns unicode and spaces.
