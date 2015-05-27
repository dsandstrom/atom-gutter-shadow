module.exports =
class GutterShadowView
  constructor: ->
    @element = document.createElement('div')
    @element.classList.add('gutter-shadow')

  destroy: ->
    @element.remove()

  getElement: ->
    @element
