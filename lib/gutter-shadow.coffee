GutterScrollView = require './gutter-scroll-view'
GutterShadowView = require './gutter-shadow-view'
{CompositeDisposable} = require 'atom'

module.exports = GutterShadow =
  disposables: null

  config:
    alwaysOn:
      type: 'boolean'
      default: false
      description:
        'The shadow shows up even when scrolled all the way to the left'

  activate: ->
    @disposables = new CompositeDisposable

    @disposables.add atom.workspace.observeTextEditors (editor) ->
      gutterScrollView = new GutterScrollView(editor)
      gutterShadowView = new GutterShadowView

      gutterScrollView.addGutterShadow(gutterShadowView)

      atom.config.observe 'gutter-shadow.alwaysOn', (alwaysOn) ->
        if alwaysOn
          gutterShadowView.activate(editor)
          gutterScrollView.addPadding()
        else
          gutterShadowView.deactivate(editor) if editor.getScrollLeft() == 0
          gutterScrollView.removePadding()

      subscription = editor.onDidChangeScrollLeft (scrollLeft) ->
        if scrollLeft == 0 and !atom.config.get('gutter-shadow.alwaysOn')
          gutterShadowView.deactivate(editor)
        else
          gutterShadowView.activate(editor)

      editor.onDidDestroy ->
        subscription.dispose()
        gutterShadowView.destroy()

  deactivate: ->
    @disposables.dispose()
