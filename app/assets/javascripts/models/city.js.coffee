class window.App.Models.City extends Cartilage.Model

  initialize: ->
    @weather = new App.Models.Forecast
      id: @id

  match: (expression) ->
    @name.match(///#{expression}///i)?
