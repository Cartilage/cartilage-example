class window.App extends Cartilage.Application

  initialize: ->
    # Collections
    App.photos = new App.Collections.Photos()
   
    # Shared Views 
    App.contentView = new App.Views.ContentView()
    App.emptyView = new App.Views.EmptyView( message: '' )

    # Routers/Navigation
    new App.Routers.Photos()
    new App.Routers.Cartilage()
    Backbone.history.start()
