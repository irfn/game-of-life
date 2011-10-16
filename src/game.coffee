class Game	
   constructor: (@grid) ->
	    $('#tick').bind 'click', (event) =>
	       @grid.tick()