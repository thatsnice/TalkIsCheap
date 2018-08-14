{ Versioned } = require './versioned'
{ Formula   } = require './formula'

class Constraint extends Versioned
  lower:     -> @getLower().value()
  upper:     -> @getUpper().value()

  satisfied: -> @lower() < @upper

module.exports = { Constraint }

Constraint.has
  upper: isa: Formula
  lower: isa: Formula
