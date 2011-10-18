class Point

   constructor: (@x, @y, @grid) ->
      @neighbourCount = 0
      @cell = null

   topLeft: () ->
      @grid.pointAt(@x - 10, @y - 10)
   
   left: () ->
      @grid.pointAt(@x - 10, @y)
   
   bottomLeft: () ->
      @grid.pointAt(@x - 10, @y + 10)
   
   topRight: () ->
      @grid.pointAt(@x + 10, @y - 10)
   
   right: () ->
      @grid.pointAt(@x + 10, @y)
   
   bottomRight: () ->
      @grid.pointAt(@x + 10, @y + 10)
   
   top: () ->
      @grid.pointAt(@x, @y - 10)
   
   bottom: () ->
      @grid.pointAt(@x, @y + 10)
   
   neighbours: () ->
      [this.topLeft(), this.left(), this.bottomLeft(), this.topRight(), this.right(), this.bottomRight(), this.top(), this.bottom()]

   ping: () ->
      @neighbourCount = 0
      @cell?.pingAttempt()
      for point in this.neighbours()
         this.pingCell() if point?.cell?

   tick: () ->      
      @cell?.life()

   populate: () ->
      this.seed() if @neighbourCount is 3 and not @cell?

   seed: () ->
      this.occupy(new Cell(this))

   occupy: (@cell) ->

   available: () ->
      @cell = null

   pingCell: () ->
      @cell?.ping()
      @neighbourCount++
