module.exports =
class GutterScrollView
  constructor: (editorElement) ->
    @element = editorElement.rootElement.querySelector('.scroll-view')

  getElement: ->
    @element

  destroy: ->
    this.removePadding()

  addGutterShadow: (gutterShadowView) ->
    @element?.appendChild(gutterShadowView.getElement())

  addPadding: ->
    @element?.classList.add('gutter-shadow-left-padding')

  removePadding: ->
    @element?.classList.remove('gutter-shadow-left-padding')
