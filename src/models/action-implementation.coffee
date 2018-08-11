{Versioned, expect} = require './versioned'

isAction = (action) -> action instanceof ActionImplementation

notParameter = (param) ->
  ('object' isnt typeof param) or
    not (param.name and param.description)

class ActionImplementation extends Versioned
  constructor: ->
    super arguments...

    expect @,
      context: ''
      implementation: ''
      parameters: (value) ->
        Array.isArray(value) and -1 is value.findIndex notParameter

  invoke: (details) ->
    args = []
    for {name} in @_get 'parameters'
      args.push details[name]

module.exports = {
  ActionImplementation
  isAction
}
