class window.App.Views.ContentView extends Cartilage.View

  el: "#content"

  setView: (view) ->
    if @currentView
      @currentView.removeFromSuperview()
    @currentView = view
    @addSubview @currentView, @el
