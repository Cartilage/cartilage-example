class window.App.Models.Forecast extends Cartilage.Model

  url: ->
    "/forecast/#{@id}"
