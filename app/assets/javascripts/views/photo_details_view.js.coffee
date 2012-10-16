class window.App.Views.PhotoDetailsView extends Cartilage.View

  initialize: (options = {}) ->
    @templateVariables = { photo: @model }

  setFile: (file) ->
    @collection = null
    @model = file
    @templateVariables = { photo: file }
    @render()

  setFiles: (files) ->
    @collection = files
    @model = null
    @templateVariables = { photos: files }
    @render()
