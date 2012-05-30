
class window.Example.Views.MainContentView extends Cartilage.View

  el: "#content"

  initialize: ->

  show: (view) ->
    if @currentView and @currentView.dismiss
      @currentView.dismiss()
    else if @currentView
      console.warn "You appear to be switching between views that do not implement a dismiss method. Please be sure that all of your views extend from Cartilage.View. "

    @currentView = view
    @currentView.render()

    ($ @el).html @currentView.el
