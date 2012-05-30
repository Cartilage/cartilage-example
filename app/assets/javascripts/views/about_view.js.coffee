
class window.Example.Views.AboutView extends Cartilage.View

  initialize: ->
    @template = JST["about"]

  render: ->
    ($ @el).html @template()
    @
