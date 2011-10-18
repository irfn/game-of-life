class Seeds

   constructor: (@grid) ->
      @seed = -1

   seedAt: (x,y) ->
      @grid.pointAt(@seed + x, y).seed()
      @grid

   glider: () ->
      @seed++
      this.seedAt(40,40)
      this.seedAt(50,50)
      this.seedAt(60,50)
      this.seedAt(60,40)
      this.seedAt(60,30)

   blinker: () ->
      @seed++
      this.seedAt(40,40)
      this.seedAt(50,40)
      this.seedAt(60,40)