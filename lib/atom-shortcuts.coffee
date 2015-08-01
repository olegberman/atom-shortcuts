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
    document.body.addEventListener 'keydown', @keyDown.bind(this)
    document.body.addEventListener 'keyup', @keyUp.bind(this)

  keyDown: (e) ->
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

  serialize: ->
    atomShortcutsViewState: @atomShortcutsView.serialize()

  html: "
    <div class='third'>
      <div class='section'>
        <h1>General</h1>
      </div>
      <div>
        cmd + shift + x
      </div>
    </div>

    <div class='third'>

    </div>

    <div class='third'>

    </div>
  "
