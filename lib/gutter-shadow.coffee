# FIXME: deactiving package doesn't remove gutter shadow views
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
    useBiggerShadow:
      type: 'boolean'
      default: false
      description:
        'The scroll shadow is larger, can be compined with the ' +
        '"Always On" setting'

  activate: ->
    @disposables = new CompositeDisposable

    @disposables.add atom.workspace.observeTextEditors (editor) ->
      editorDisposables = new CompositeDisposable
      gutterScrollView  = new GutterScrollView(editor)
      gutterShadowView  = new GutterShadowView

      gutterScrollView.addGutterShadow(gutterShadowView)

      editorDisposables.add atom.config.observe 'gutter-shadow.alwaysOn', (alwaysOn) ->
        if alwaysOn
          gutterShadowView.setAlwaysOn()
          gutterScrollView.addPadding()
        else
          gutterShadowView.unsetAlwaysOn()
          gutterScrollView.removePadding()

      editorDisposables.add atom.config.observe 'gutter-shadow.useBiggerShadow', (useBiggerShadow) ->
        if useBiggerShadow
          gutterShadowView.setBiggerShadow()
        else
          gutterShadowView.unsetBiggerShadow()

      editorDisposables.add editor.onDidChangeScrollLeft (scrollLeft) ->
        if scrollLeft == 0
          gutterShadowView.deactivate()
        else
          gutterShadowView.activate()

      editor.onDidDestroy ->
        editorDisposables.dispose()
        gutterShadowView.destroy()
        gutterScrollView.destroy()

  deactivate: ->
    @disposables.dispose()
