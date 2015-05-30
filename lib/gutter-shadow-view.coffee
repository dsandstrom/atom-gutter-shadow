{$} = require 'atom'

module.exports =
class GutterShadowView
  constructor: ->
    @element = document.createElement('div')
    @element.classList.add('gutter-shadow')

  destroy: ->
    @element.remove()

  getElement: ->
    @element

  activate: (editor) ->
    element = atom.views.getView(editor)
    root = $(element.rootElement)
    root.find('.gutter-shadow').addClass('active')

  deactivate: (editor) ->
    element = atom.views.getView(editor)
    root = $(element.rootElement)
    root.find('.gutter-shadow').removeClass('active')
