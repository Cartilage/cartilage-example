class window.App.Views.PhotoDetailsView extends Cartilage.View

  initialize: (options = {}) ->
    super(options)
    @templateVariables = { photo: @model }

  setPhoto: (photo) ->
    @collection = null
    @model = photo
    @templateVariables = { photo: photo}
    @render()

  setPhotos: (photos) ->
    @collection = photos
    @model = null
    @templateVariables = { photos: photos }
    @render()
