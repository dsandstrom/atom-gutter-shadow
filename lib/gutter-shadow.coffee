GutterShadowView = require './gutter-shadow-view'
{View, $} = require 'atom'
{CompositeDisposable} = require 'atom'

module.exports = GutterShadow =
  gutterShadowView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    # @gutterShadowView = new GutterShadowView(state.gutterShadowViewState)
    # containers = atom.views.getView atom.workspace
    #   .querySelector('.underlayer')
    #   .appendChild @gutterShadowView.getElement()
    console.log 'adding gutter shadow'
    @disposables = new CompositeDisposable
    editors = []

    @disposables.add atom.workspace.observeTextEditors (editor) ->
      editors.push editor
      element = atom.views.getView(editor)
      root = $(element.rootElement)
      scrollView = root.find('.scroll-view')
      scrollView
        .append(new GutterShadowView().getElement())

    for editor in editors
      @disposables.add editor.onDidChangeScrollLeft (scrollLeft) ->
        # # atom.views.getView atom.workspace
        # #   .querySelector '.scroll-view'
        # #   .classList.add 'gutter-shadow'
        # editor.getModel()
        activeEditor = atom.workspace.getActiveTextEditor()
        if scrollLeft == 0
          console.log 'remove shadow'
          element = atom.views.getView(activeEditor)
          root = $(element.rootElement)
          root.find('.gutter-shadow').removeClass('active')
        else
          console.log 'add shadow'
          element = atom.views.getView(activeEditor)
          root = $(element.rootElement)
          root.find('.gutter-shadow').addClass('active')

  deactivate: ->
    @disposables.dispose()
    @gutterShadowView.destroy()

  serialize: ->
    gutterShadowViewState: @gutterShadowView.serialize()

  toggle: ->
    console.log 'GutterShadow was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
