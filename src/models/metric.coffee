{ Versioned }            = require './versioned'
{ ActionImplementation } = require './action-implementation'

class Metric extends Versioned
  measure: (resource) ->
    # Observe this Metric on the specified Resource, creating a Measurement

module.exports = {Metric}

Metric.has
  implementation: isa: ActionImplementation
  units:          ''
  rangeFrom:      ''
  rangeTo:        ''


