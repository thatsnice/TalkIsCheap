{ Versioned } = require './versioned'
{ Action    } = require './action'

notParameter = (param) ->
  ('object' isnt typeof param) or
    not (param.name and param.description)

class ActionImplementation extends Versioned
  # ::invoke will create and start an Action
  invoke: (context) ->
    args = []

    for {name} in @_get 'parameters'
      args.push context.determine name

module.exports = { ActionImplementation }

ActionImplementation.has
  context:        ''
  implementation: ''
  parameters:     (value) -> Array.isArray(value) and -1 is value.findIndex notParameter
