{Versioned}            = require './versioned'
{ActionImplementation} = require './action-implementation'

class Metric extends Versioned
  @expects: ->
    ActionImplementation: isa: ActionImplementation
    units:      ''
    rangeFrom:  ''
    rangeTo:    ''

  measure: (resource) ->
    # Observe this Metric on the specified Resource, creating a Measurement

module.exports = {Metric}
