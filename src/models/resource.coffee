{Measurement}  = require './measurement'
{ResourceType} = require './resource-type'

class Resource extends Measurement
  @expects: ->
    resourceType: isa: ResourceType

