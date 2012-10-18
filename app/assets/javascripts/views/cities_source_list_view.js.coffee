class window.App.Views.CitiesSourceListView extends Cartilage.Views.SourceListView

  events: _.extend {
    "search input[type=search]": "filterCollection"
    "keyup input[type=search]": "filterCollection"
  }, Cartilage.Views.ListView.prototype.events

  filterCollection: =>
    @filter = (@$ "#city-filter-field").val()
    if @filter
      @collection.reset App.cities.select (city) =>
        city.match(@filter)
    else
      @collection.reset App.cities.models
