# TODO: Not directly related to TIC. Move to its own library.

id = 0

class Versioned
  constructor: (@_changed = {}, @prev = null) ->
    @committed = false
    @id = id++
    @_set 'name', @id if not @_get 'name'
    @deleted = false

  _get: (propName) -> @_changed[propName] ? @prev?[propName]

  _set: (propName, value) ->
    if @committed
      (Versioned.makeNew @)._set propName, value
    else
      @_changed[propName] = value
      @

  _commit: -> @committed = true

module.exports = {Versioned}
