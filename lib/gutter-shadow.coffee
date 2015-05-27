GutterShadowView = require './gutter-shadow-view'
{CompositeDisposable, $} = require 'atom'

module.exports = GutterShadow =
  disposables: null

  activate: ->
    @disposables = new CompositeDisposable

    @disposables.add atom.workspace.observeTextEditors (editor) ->
      gutterShadowView = new GutterShadowView
      element = atom.views.getView(editor)
      root = $(element.rootElement)
      scrollView = root.find('.scroll-view')
      scrollView .append(gutterShadowView.getElement())

      subscription = editor.onDidChangeScrollLeft (scrollLeft) ->
        if scrollLeft == 0
          element = atom.views.getView(editor)
          root = $(element.rootElement)
          root.find('.gutter-shadow').removeClass('active')
        else
          element = atom.views.getView(editor)
          root = $(element.rootElement)
          root.find('.gutter-shadow').addClass('active')

      editor.onDidDestroy ->
        subscription.dispose()
        gutterShadowView.destroy()

  deactivate: ->
    @disposables.dispose()
