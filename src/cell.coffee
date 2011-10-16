class Cell
   constructor: (@point) ->
      @ctx = $('#grid')[0].getContext("2d")
      this.spawn()

   shade: () ->
      undefined:"rgb(200,200,200)"
      1:"rgb(100,0,0)"
      2:"rgb(120,0,0)"
      3:"rgb(140,0,0)"
      4:"rgb(150,0,0)"
      5:"rgb(160,0,0)"
      6:"rgb(170,0,0)"

   render: () ->
      @ctx.fillStyle = this.shade()[@currentAge]
      @ctx.fillRect(@point.x, @point.y, 10, 10)

   ping: () ->
      @pingCount++

   spawn: () ->
     @currentAge = 1
     @pingCount = 0	
     this.render()

   die: () ->
      @currentAge = undefined
      this.render()
      @point.available()

   age: () ->
      @currentAge++

   lonely: () ->
      @pingCount < 2 

   crowded: () ->
      @pingCount > 3 

   life: ()  ->
	    if @pingCount > 0
         if this.lonely() or this.crowded()
            this.die()
         else 
            this.age() and this.render()
         @pingCount = 0
