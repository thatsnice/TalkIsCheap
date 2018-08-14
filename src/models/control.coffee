{ Versioned            } = require './versioned'
{ ActionImplementation } = require './action-implementation'
{ Constraint           } = require './constraint'

class Control extends Versioned
  bump: (context) -> @getBump().invoke context

Control.has
  bump:          isa: ActionImplementation
  preRequisite:  isa: Constraint
  postRequisite: isa: Constraint

module.exports = { Control }
