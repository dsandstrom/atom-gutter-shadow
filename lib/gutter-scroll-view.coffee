module.exports =
class GutterScrollView
  constructor: (editor) ->
    editorElement = atom.views.getView(editor)
    @element = editorElement.rootElement.querySelector('.scroll-view')

  getElement: ->
    @element

  addGutterShadow: (gutterShadowView) ->
    @element.appendChild(gutterShadowView.getElement())

  addPadding: ->
    @element.classList.add('gutter-shadow-left-padding')

  removePadding: ->
    @element.classList.remove('gutter-shadow-left-padding')
