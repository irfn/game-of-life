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

   gosperGlider: () ->
      @seed++
      this.seedAt(250, 80)
      this.seedAt(230, 90)
      this.seedAt(250, 90)
      this.seedAt(130, 100)
      this.seedAt(140, 100)
      this.seedAt(210, 100)
      this.seedAt(220, 100)
      this.seedAt(350, 100)
      this.seedAt(360, 100)
      this.seedAt(120, 110)
      this.seedAt(160, 110)
      this.seedAt(210, 110)
      this.seedAt(220, 110)
      this.seedAt(350, 110)
      this.seedAt(360, 110)
      this.seedAt(10,  120)
      this.seedAt(20,  120)
      this.seedAt(110, 120)
      this.seedAt(170, 120)
      this.seedAt(210, 120)
      this.seedAt(220, 120)
      this.seedAt(10,  130)
      this.seedAt(20,  130)
      this.seedAt(110, 130)
      this.seedAt(150, 130)
      this.seedAt(170, 130)
      this.seedAt(180, 130)
      this.seedAt(230, 130)
      this.seedAt(250, 130)
      this.seedAt(110, 140)
      this.seedAt(170, 140)
      this.seedAt(250, 140)
      this.seedAt(120, 150)
      this.seedAt(160, 150)
      this.seedAt(130, 160)
      this.seedAt(140, 160)
