{Versioned, expect}    = require './versioned'
{ActionImplementation} = require './action-implementation'

class Metric extends Versioned
  constructor: ->
    super arguments...

    expect @,
      ActionImplementation: (value) ->
        value instanceof ActionImplementation
      parameters: ''
      units:      ''
      rangeFrom:  ''
      rangeTo:    ''

module.exports = {Metric}
