class window.App.Routers.Base extends Backbone.Router

  switchTab: (active_tab) ->
    ($ "ul.nav li").removeClass("active")
    ($ "#nav-" + active_tab).addClass("active")
