{Versioned, expect} = require './versioned'

isAction = (action) -> action instanceof ActionImplementation

class ActionImplementation extends Versioned
  constructor: ->
    super arguments...

    expect @,
      context: ''
      implementation: ''

module.exports = {
  ActionImplementation
  isAction
}
