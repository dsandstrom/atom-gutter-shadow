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
    @element.classList.add('active')

  deactivate: (editor) ->
    @element.classList.remove('active')
