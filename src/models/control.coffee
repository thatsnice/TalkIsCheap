{ Versioned
  expect
} = require './versioned'

{ ActionImplementation
  isAction
} = require './action-implementation'


class Control extends Versioned
  constructor: ->
    super arguments...

    expect @,
      increase:      isAction
      decrease:      isAction
      preRequisite:  isConstraint
      postRequisite: isConstraint
      rollback:      isAction

