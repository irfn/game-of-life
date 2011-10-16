class Grid	
   constructor: (@x,@y) ->
      @points = {}
      @pointList = []
      for x in [0..@x] by 10
         for y in [0..@y] by 10
            point = new Point(x,y, this)
            @pointList.push point
            @points["#{x}-#{y}"] = point

   pointAt: (x, y) ->
      @points["#{x}-#{y}"]

   tick: () ->
      point.ping() for point in @pointList
      point.populate() for point in @pointList         
      point.tick() for point in @pointList
         

