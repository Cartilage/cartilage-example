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
    @splitView = new Cartilage.Views.HorizontalSplitView {
      firstView: @matrixView, 
      secondView: @photoDetailsView,
      orientation: "horizontal",
      isResizable: false
    }

    @splitView.position(0)
    @addSubview @splitView, (@$ "#page-content")