class window.App.Models.Forecast extends Backbone.Model

  url: ->
    '/forecast/' + @get('id')
