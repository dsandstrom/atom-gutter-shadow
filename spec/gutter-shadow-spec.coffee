GutterShadow = require '../lib/gutter-shadow'

describe "GutterShadow", ->
  [editor, root] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    jasmine.attachToDOM(workspaceElement)

    waitsForPromise ->
      atom.workspace.open('sample.coffee').then (o) ->
        editor = o
        root = atom.views.getView(editor).rootElement

    waitsForPromise ->
      atom.packages.activatePackage('gutter-shadow')

  describe "when scrolling", ->
    beforeEach ->
      editor.setWidth(10)
      editor.setText('test')

    describe "when shadow is off by default", ->
      beforeEach ->
        atom.config.set('gutter-shadow.alwaysOn', false)

      it "toggles the active class", ->
        gutterShadow = root.querySelector('.gutter-shadow')

        expect(gutterShadow).toExist()
        expect(gutterShadow.classList.contains('active')).toBeFalsy()

        editor.setScrollLeft(1)
        expect(gutterShadow.classList.contains('active')).toBeTruthy()

        editor.setScrollLeft(0)
        expect(gutterShadow.classList.contains('active')).toBeFalsy()

    describe "when shadow is always on", ->
      beforeEach ->
        atom.config.set('gutter-shadow.alwaysOn', true)

      it "doesn't toggle the active class", ->
        gutterShadow = root.querySelector('.gutter-shadow')

        expect(gutterShadow).toExist()
        expect(gutterShadow.classList.contains('active')).toBeTruthy()

        editor.setScrollLeft(1)
        expect(gutterShadow.classList.contains('active')).toBeTruthy()

        editor.setScrollLeft(0)
        expect(gutterShadow.classList.contains('active')).toBeTruthy()

  describe "alwaysOn config", ->
    it "adds the padding class to the scroll view", ->
      cssClass = 'gutter-shadow-left-padding'
      scrollView = root.querySelector('.scroll-view')

      expect(scrollView).toExist()

      atom.config.set('gutter-shadow.alwaysOn', false )
      expect(scrollView.classList.contains(cssClass)).toBeFalsy()

      atom.config.set('gutter-shadow.alwaysOn', true)
      expect(scrollView.classList.contains(cssClass)).toBeTruthy()

      atom.config.set('gutter-shadow.alwaysOn', false)
      expect(scrollView.classList.contains(cssClass)).toBeFalsy()
