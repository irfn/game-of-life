class Game	
   constructor: (@grid) ->
      @refreshIntervalId = undefined
      $('#tick').bind 'click', (event) =>
	       @grid.tick()
      $('#run').bind 'click', (event) =>
	       @refreshIntervalId = setInterval ->
            $('#tick').trigger 'click'
         , 100
         $('#stop').bind 'click', (event) =>
	         clearInterval @refreshIntervalId