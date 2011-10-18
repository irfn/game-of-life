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

   pingAttempt: () ->
      @pingAttempted = true

   spawn: () ->
     @currentAge = 0
     @pingCount = 0
     @pingAttempted = false
     this.render()
     this.age()

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
	    if @pingAttempted
         if this.lonely() or this.crowded()
            this.die()
         else 
            this.render() and this.age()
         @pingCount = 0
         @pingAttempted = false
