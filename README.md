# Gutter Shadow
###### An Atom Package - [Atom.io](https://atom.io/packages/gutter-shadow) : [Github](https://github.com/dsandstrom/atom-gutter-shadow) : [![Build Status](https://travis-ci.org/dsandstrom/atom-gutter-shadow.svg?branch=master)](https://travis-ci.org/dsandstrom/atom-gutter-shadow)

Add a shadow under the gutter when you are scrolled away from it. This makes it easier to tell when you aren't scrolled all the way to the left.

![screenshot][screenshot]

### Configuration

<dl>
  <dt>Always On</dt>
  <dd>
    The shadow is always visible, even when scrolled all the way to the left.
  </dd>

  <dt>Bigger Shadow</dt>
  <dd>
    The scrolled shadow is more pronounced.  If "Always On" is enabled, the shadow changes from small to large when scrolling.
  </dd>
</dl>

### DIY
If you want to edit the shadow, add this to your _styles.less_ file:
```less
atom-text-editor {
  // scrolled shadow
  .gutter-shadow.active {
    box-shadow: 0 0 7px 4px rgba(0, 0, 0, .25);
  }
  // bigger scrolled shadow
  .gutter-shadow.active.bigger-shadow {
    box-shadow: 0 0 10px 6px rgba(0, 0, 0, .25);
  }
}
```

### Notes
* v1.0.0 introduces a style change, remove `inset` from your DIY shadow
* Issues/PRs are welcome.

[screenshot]: http://content.screencast.com/users/dsandstrom/folders/Jing/media/6e5c193e-29fc-49ff-bab9-2666de15f865/00000039.png
