class window.App.Models.City extends Backbone.Model

  initialize: ->
    @weather = new App.Models.Forecast
      id: @get('id')

  match: (expression) ->
    @get("name").match(///#{expression}///i)?
