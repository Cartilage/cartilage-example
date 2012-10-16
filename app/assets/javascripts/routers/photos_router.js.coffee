class window.App.Routers.Photos extends App.Routers.Base

  routes:
    "": "index"
    "photos": "index"

  index: ->
    @switchTab('photos')

    @collectionFetched = new $.Deferred

    App.photos.fetch
      success: =>
        @collectionFetched.resolve()

    @collectionFetched.done =>     
      @photosView = new App.Views.PhotosView({ collection: App.photos })
      App.contentView.show(@photosView)
