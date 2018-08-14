# TODO: Not directly related to TIC. Move to its own library.

id = 0

expect = (instance, expectations) ->
  for name, expectation of expectations
    value = instance._get name
    switch
      when 'string' is typeof expectation             then assert value isnt undefined
      when 'object' is typeof klass = expectation.isa then assert value instanceof klass

validate = (klass, name, value, details) ->
  if details.isa instanceof Object
    if value not instanceof isa = details.isa
      throw new Error "#{klass.name}::[#{name}] must be an instance of #{isa.name}"

  if 'function' is typeof details
    if err = details value
      throw new Error err

addAccessors = (klass, name, details) ->
  Name = name[0].toUpperCase() + name[1..]
  klass::["get" + Name] =         -> @_get name
  klass::["set" + Name] = (value) -> validate klass, name, value, details

class Versioned
  has: (props) ->
    for name, details of props
      addAccessors @, name, details

  constructor: (changed = {}, @prev = null) ->
    @committed = false
    @id = id++
    @_set 'name', @id unless 'string' is typeof @_get 'name'
    @deleted = false

    for name, value of changed
      @_set name, value

  _get: (propName) -> @_changed[propName] ? @prev?[propName]

  _set: (propName, value) ->
    if @committed
      (Versioned.makeNew @)._set propName, value
    else
      @_changed[propName] = value
      @

  _commit: -> @committed = true

module.exports = { Versioned }
