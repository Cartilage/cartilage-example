class window.App.Routers.Photos extends App.Routers.Base

  routes:
    "": "index"
    "photos": "index"

  index: ->
    @switchTab('photos')
    @photosView = new App.Views.PhotosView
    App.contentView.show(@photosView)
