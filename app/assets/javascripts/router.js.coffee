
class window.Example.Router extends Backbone.Router

  routes:
    "": "showAboutView"
    "about": "showAboutView"
    "components": "showComponentsView"

  initialize: ->
    @mainContentView = new Example.Views.MainContentView

  showAboutView: ->
    @aboutView ?= new Example.Views.AboutView
    @switchTab("about")
    @mainContentView.show(@aboutView)

  showComponentsView: ->
    @componentsView ?= new Example.Views.ComponentsView
    @switchTab("components")
    @mainContentView.show(@componentsView)

  switchTab: (tabName) ->

    # Clear the previously selected tab
    ($ "ul.nav li").removeClass("active")

    # Highlight the newly selected tab
    ($ "#nav-#{tabName}").addClass("active")
