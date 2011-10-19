class Game	
   constructor: (@grid) ->
      @refreshIntervalId = undefined
      $('#tick').unbind('click');
      $('#run').unbind('click');
      $('#stop').unbind('click');
      $('#tick').bind 'click', (event) =>
	       @grid.tick()
      $('#run').bind 'click', (event) =>
	       @refreshIntervalId = setInterval ->
            $('#tick').trigger 'click'
         , 100
         $('#stop').bind 'click', (event) =>
	         clearInterval @refreshIntervalId

$(document).ready ->
   $("#seed").change ->
      canvas = $('#grid')[0]
      canvas.width = canvas.width
      seed = $("#seed option:selected").attr('value')
      new Game(new Seeds(new Grid(500,600))[seed]())
   $("#seed").change();