class Seeds

   constructor: (@grid) ->

   beacon: () ->
      @grid.pointAt(40,40).seed()
      @grid.pointAt(50,50).seed()
      @grid.pointAt(60,50).seed()
      @grid.pointAt(60,40).seed()
      @grid.pointAt(60,30).seed()
      @grid