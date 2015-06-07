module.exports =
class GutterShadowView
  constructor: ->
    @element = document.createElement('div')
    @element.classList.add('gutter-shadow')

  destroy: ->
    @element?.remove()

  getElement: ->
    @element

  activate:  ->
    @element?.classList.add('active')

  deactivate: ->
    @element?.classList.remove('active')

  setAlwaysOn: ->
    @element?.classList.add('always-on')

  unsetAlwaysOn: ->
    @element?.classList.remove('always-on')

  setBiggerShadow: ->
    @element?.classList.add('bigger-shadow')

  unsetBiggerShadow: ->
    @element?.classList.remove('bigger-shadow')
