class window.App.Models.Photo extends Backbone.Model

  thumbnailUrl: ->
    @get('media').m