class window.App extends Cartilage.Application

  initialize: ->
    # Routers/Navigation
    new App.Routers.Base()
    Backbone.history.start()
 