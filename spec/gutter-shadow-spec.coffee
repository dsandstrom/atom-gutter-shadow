GutterShadow = require '../lib/gutter-shadow'

describe "GutterShadow", ->
  [editor, root] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace).__spacePenView
    waitsForPromise ->
      atom.workspace.open('sample.coffee').then (o) ->
        editor = o
        root = atom.views.getView(editor).rootElement
    waitsForPromise ->
      atom.packages.activatePackage('gutter-shadow')
    workspaceElement.attachToDom()

  describe "when the scrolling", ->
    beforeEach ->
      editor.setWidth(10)
      editor.setText('test')

    fit "toggles the active class", ->
      gutterShadow = root.querySelector('.gutter-shadow')

      expect(gutterShadow).toExist()
      expect(gutterShadow.classList.contains('active')).toBeFalsy()

      editor.setScrollLeft(1)
      expect(gutterShadow.classList.contains('active')).toBeTruthy()

      editor.setScrollLeft(0)
      expect(gutterShadow.classList.contains('active')).toBeFalsy()
