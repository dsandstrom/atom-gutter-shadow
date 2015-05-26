GutterShadowView = require './gutter-shadow-view'
{CompositeDisposable} = require 'atom'

module.exports = GutterShadow =
  gutterShadowView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @gutterShadowView = new GutterShadowView(state.gutterShadowViewState)
    # containers = atom.views.getView atom.workspace
    #   .querySelector('.underlayer')
    #   .appendChild @gutterShadowView.getElement()
    console.log 'adding gutter shadow'
    # atom.views.getView atom.workspace
    #   .querySelector('.item-views')
    #   .appendChild @gutterShadowView.getElement()
    # atom.workspace.observeTextEditors (editor) ->
    #   editor.querySelector('.underlayer').appendChild @gutterShadowView.getElement()
    @editorSubscriptions = atom.workspace.observeTextEditors (editor) ->
      @scrollSubscriptions = editor.onDidChangeScrollLeft (scrollLeft) ->
        if scrollLeft == 0
          console.log 'remove shadow'
        else
          console.log 'add shadow'

  deactivate: ->
    @editorSubscriptions.dispose()
    @scrollSubscriptions.dispose()
    @gutterShadowView.destroy()

  serialize: ->
    gutterShadowViewState: @gutterShadowView.serialize()

  toggle: ->
    console.log 'GutterShadow was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
