module.exports =
class GutterShadowView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('gutter-shadow')

    # Create message element
    # message = document.createElement('div')
    # message.textContent = "The GutterShadow package is Alive! It's ALIVE!"
    # message.classList.add('message')
    # @element.appendChild(message)
    # @container = $('.underlayer')
    # @container.appendChild(@element)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  addGutterShadow: ->
    console.log 'gutter'
