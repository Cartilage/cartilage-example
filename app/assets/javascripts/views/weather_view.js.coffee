class window.App.Views.WeatherView extends Cartilage.View

  initialize: (options = {}) ->
    super(options)

  prepare: ->
    log(@collection)
    @citiesSourceListView = new Cartilage.Views.SourceListView {
      collection: @collection,
      itemView: App.Views.CitiesSourceListViewItem
    }

    @observe @citiesSourceListView, 'select', @switchCurrentView

    # Configure the Split View
    @splitView = new Cartilage.Views.SplitView {
      firstView: @citiesSourceListView,
      secondView: App.emptyView,
      orientation: "vertical",
      isResizable: false
    }

    @splitView.position(160);
    @addSubview @splitView, (@$ "#page-content")

  switchCurrentView: (e) ->
    model = e.models[0]
    @setSecondView(model)

  setSecondView: (model) ->
    @weatherFetched = new $.Deferred
    model.weather.fetch
      success: =>
        @weatherFetched.resolve()

    @weatherFetched.done =>
      @weatherDetailView = new App.Views.WeatherDetailView
        model: model.weather
      @splitView.setSecondView(@weatherDetailView)

