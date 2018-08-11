# TODO: Not directly related to TIC. Move to its own library.

id = 0

expect = (instance, expectations) ->
  for name, expectation of expectations
    value = instance._get name
    switch
      when 'string' is typeof expectation             then assert value isnt undefined
      when 'object' is typeof klass = expectation.isa then assert value instanceof klass

class Versioned
  constructor: (@_changed = {}, @prev = null) ->
    @committed = false
    @id = id++
    @_set 'name', @id unless 'string' is typeof @_get 'name'
    @deleted = false

    if 'function' is typeof @constructor.expects
      expect instance, @constructor.expects @

  _get: (propName) -> @_changed[propName] ? @prev?[propName]

  _set: (propName, value) ->
    if @committed
      (Versioned.makeNew @)._set propName, value
    else
      @_changed[propName] = value
      @

  _commit: -> @committed = true

module.exports = {Versioned}
