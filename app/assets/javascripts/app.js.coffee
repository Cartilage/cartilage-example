class window.App extends Cartilage.Application

  initialize: ->
    # Collections
    @photos ||= new App.Collections.Photos()
   
    # Shared Views 
    App.contentView = new App.Views.ContentView()
    App.emptyView = new App.Views.EmptyView( message: '' )

    # Routers/Navigation
    @initializeRouters()
    Backbone.history.start()

  initializeRouters: ->
    new App.Routers.Photos()
    new App.Routers.Cartilage()