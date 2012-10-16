class window.App.Views.PhotosView extends Cartilage.View

  prepare: ->
    # Configure Matrix View
    @matrixView = new Cartilage.Views.MatrixView {
      collection: @collection,
      itemView: App.Views.PhotoMatrixViewItem,
      allowsSelection: true,
      allowsRemove: true,
      allowsDragSelection: true,
      allowsMultipleSelection: true,
      allowsDeselection: true
    }

    @photoDetailsView = new App.Views.PhotoDetailsView( model: new App.Models.Photo )

   # Configure the Split View
    @splitView = new Cartilage.Views.SplitView {
      firstView: @matrixView, 
      secondView: @photoDetailsView,
      orientation: "horizontal",
      isResizable: false
    }

    @observe @matrixView, "select", @selectPhotos
    @observe @matrixView, "clear", @selectionCleared

    App.matrixView = @matrixView
    @addSubview @splitView, (@$ "#page-content")

  selectPhotos: (models) ->
    if models.length > 1
      @photoDetailsView.setPhotos models
    else
      @photoDetailsView.setPhoto models.first()

    @splitView.position(64, { animated: true })

  selectionCleared: =>
    @splitView.position(0, { animated: true })
