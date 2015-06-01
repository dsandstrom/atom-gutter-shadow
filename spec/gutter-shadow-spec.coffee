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

    it "toggles the active class on the gutter shadow", ->
      gutterShadow = root.querySelector('.gutter-shadow')

      expect(gutterShadow).toExist()
      expect(gutterShadow.classList.contains('active')).toBeFalsy()

      editor.setScrollLeft(1)
      expect(gutterShadow.classList.contains('active')).toBeTruthy()

      editor.setScrollLeft(0)
      expect(gutterShadow.classList.contains('active')).toBeFalsy()

  describe "alwaysOn config", ->
    it "toggles the always-on class on the gutter shadow", ->
      cssClass = 'always-on'
      gutterShadow = root.querySelector('.gutter-shadow')

      expect(gutterShadow).toExist()

      atom.config.set('gutter-shadow.alwaysOn', false)
      expect(gutterShadow.classList.contains(cssClass)).toBeFalsy()

      atom.config.set('gutter-shadow.alwaysOn', true)
      expect(gutterShadow.classList.contains(cssClass)).toBeTruthy()

      atom.config.set('gutter-shadow.alwaysOn', false)
      expect(gutterShadow.classList.contains(cssClass)).toBeFalsy()

    it "toggles padding class on the scroll view", ->
      cssClass = 'gutter-shadow-left-padding'
      scrollView = root.querySelector('.scroll-view')

      expect(scrollView).toExist()

      atom.config.set('gutter-shadow.alwaysOn', false)
      expect(scrollView.classList.contains(cssClass)).toBeFalsy()

      atom.config.set('gutter-shadow.alwaysOn', true)
      expect(scrollView.classList.contains(cssClass)).toBeTruthy()

      atom.config.set('gutter-shadow.alwaysOn', false)
      expect(scrollView.classList.contains(cssClass)).toBeFalsy()

  describe "useBiggerShadow config", ->
    it "toggles the bigger-shadow class on the gutter shadow", ->
      cssClass = 'bigger-shadow'
      gutterShadow = root.querySelector('.gutter-shadow')

      expect(gutterShadow).toExist()

      atom.config.set('gutter-shadow.useBiggerShadow', false)
      expect(gutterShadow.classList.contains(cssClass)).toBeFalsy()

      atom.config.set('gutter-shadow.useBiggerShadow', true)
      expect(gutterShadow.classList.contains(cssClass)).toBeTruthy()

      atom.config.set('gutter-shadow.useBiggerShadow', false)
      expect(gutterShadow.classList.contains(cssClass)).toBeFalsy()
