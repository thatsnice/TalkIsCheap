getProto = Object.getPrototypeOf o

protosOf = (o) ->
  proto = getProto o

  (proto = getProto proto while proto)

initializers = (o, stopAt) ->

class Initialized
  constructor: (opts = {}) ->
    for initializer in initializers @
      proto in protos when init = initFor proto
        init @, opts


Object.assign module.exports, {Initialized}
