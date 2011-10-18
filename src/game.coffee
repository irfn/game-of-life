class Game	
   constructor: (@grid) ->
	    $('#tick').bind 'click', (event) =>
	       @grid.tick()
	    # $('#run').bind 'click', (event) =>
			   # @grid.tick() for x in [1..10]				