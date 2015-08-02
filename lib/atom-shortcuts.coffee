module.exports = AtomShortcuts =

  window: null

  ctrl:
    code: 17
    down: no

  backTick:
    code: 192
    down: no

  activate: (state) ->
    @window = document.createElement 'div'
    @window.className = 'atom-shortcuts'
    @window.innerHTML = @html
    @window.style.display = 'none'
    document.body.appendChild(@window)
    @keyDown = @keyDown.bind(@)
    @keyUp = @keyUp.bind(@)
    document.body.addEventListener 'keydown', @keyDown
    document.body.addEventListener 'keyup', @keyUp

  keyDown: (e) ->
    console.log e
    @backTick.down = yes if e.which is @backTick.code
    @ctrl.down = yes if e.which is @ctrl.code
    @showWindow() if @backTick.down and @ctrl.down

  keyUp: (e) ->
    @backTick.down = no if e.which is @backTick.code
    @ctrl.down = no if e.which is @ctrl.code
    @hideWindow() if !@backTick.down or !@ctrl.down

  showWindow: ->
    @window.style.display = 'block'

  hideWindow: ->
    @window.style.display = 'none'

  deactivate: ->
    document.body.removeEventListener 'keydown', @keyDown
    document.body.removeEventListener 'keyup', @keyUp
    @window.remove()

  html: "
    <!-- First column -->
    <div class='one-third'>
      <!-- General section -->
      <div class='section'>
        <h2>General</h1>
        <div class='item'>
          <p><b>shift + ⌘ + p</b></p>
          Toggle command palette
        </div>
        <div class='item'>
          <p><b>⌘ + /</b></p>
          Toggle line/selection comment
        </div>
        <div class='item'>
          <p><b>ctrl + space</b></p>
          Show available auto-completions
        </div>
      </div>
      <!-- /General section -->

      <!-- Find section -->
      <div class='section'>
        <h2>Find</h1>
        <div class='item'>
          <p><b>⌘ + f</b></p>
          Find in file
        </div>
        <div class='item'>
          <p><b>⌘ + g</b></p>
          Find next
        </div>
        <div class='item'>
          <p><b>shift + ⌘ + f</b></p>
          Find in project
        </div>
        <div class='item'>
          <p><b>⌘ + e</b></p>
          Use selection for find
        </div>
      </div>
      <!-- /Find section -->

    </div>
    <!-- /First column -->

    <!-- Second column -->
    <div class='one-third'>

    </div>
    <!-- /Second column -->

    <!-- Third column -->
    <div class='one-third'>

    </div>
    <!-- /Third column -->
  "
