class Cell
   constructor: (@point) ->
      @ctx = $('#grid')[0].getContext("2d")
      this.spawn()

   shade: () ->
      if @currentAge? then "rgb(#{ 100 + @currentAge * 10 },0,0)" else "rgb(200,200,200)" 

   render: () ->
      @ctx.fillStyle = this.shade()
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
