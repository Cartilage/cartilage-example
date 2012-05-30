
class window.Example.Views.ComponentsView extends Cartilage.View

  initialize: ->
    @template = JST["components"]

  render: ->
    ($ @el).html @template()
    @
