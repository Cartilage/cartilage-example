class window.App.Routers.Cartilage extends App.Routers.Base

  routes:
    "about": "showAboutView"

  showAboutView: ->
    @aboutView ?= new Example.Views.AboutView
    @switchTab("about")
    App.contentView.show(@aboutView)
