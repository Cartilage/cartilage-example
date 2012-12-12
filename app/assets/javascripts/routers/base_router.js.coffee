class window.App.Routers.Base extends Backbone.Router
  routes:
    "": "showAboutView"
    "matrixview": "showMatrixView"
    "listview": "showListView"
    "sourcelistview": "showSourceListView"
    "usagebarview": "showUsageBarView"
    "todosview": "showTodosView"
    "about": "showAboutView"

  initialize: ->
    App.contentView = new App.Views.ContentView()
    App.emptyView = new App.Views.EmptyView( message: '' )

  switchTab: (active_tab) ->
    ($ "ul.nav li").removeClass("active")
    ($ "#nav-" + active_tab).addClass("active")

  showAboutView: ->
    @aboutView ?= new App.Views.AboutView
    @switchTab("about")
    App.contentView.show(@aboutView)

  showMatrixView: ->
    @switchTab('matrixview')

    if @photosView
      App.contentView.show(@photosView)
    else
      @loadingIndicator = new Cartilage.Views.LoadingIndicatorView
      @loadingIndicator.start()
      App.contentView.show(@loadingIndicator)

      @collectionFetched = new $.Deferred

      App.photos = new App.Collections.Photos()
      App.photos.fetch
        success: =>
          @collectionFetched.resolve()

      @collectionFetched.done =>
        @photosView = new App.Views.PhotosView({ collection: App.photos })
        App.contentView.show(@photosView)


  showListView: ->
    @switchTab('listview')

    if @tweetsView
      App.contentView.show(@tweetsView)
    else
      @loadingIndicator = new Cartilage.Views.LoadingIndicatorView
      @loadingIndicator.start()
      App.contentView.show(@loadingIndicator)

      @collectionFetched = new $.Deferred

      App.tweets = new App.Collections.Tweets()
      App.tweets.fetch
        success: =>
          @collectionFetched.resolve()

      @collectionFetched.done =>
        @tweetsView = new App.Views.TweetsView({ collection: App.tweets })
        App.contentView.show(@tweetsView)

  showSourceListView: ->
    @switchTab('sourcelistview')

    if @weatherView
      App.contentView.show(@weatherView)
    else
      @loadingIndicator = new Cartilage.Views.LoadingIndicatorView
      @loadingIndicator.start()
      App.contentView.show(@loadingIndicator)

      @collectionFetched = new $.Deferred

      App.cities = new App.Collections.Cities()
      App.cities.fetch
        success: =>
          @collectionFetched.resolve()

      @collectionFetched.done =>
        @weatherView = new App.Views.WeatherView({ collection: new App.Collections.Cities(App.cities.models) })
        App.contentView.show(@weatherView)

  showUsageBarView: ->
    @switchTab('usagebarview')

    if @usageBarView
      App.contentView.show(@usageBarView)
    else
      @hours = new App.Models.Hours
      @usageBarView = new App.Views.UsageBarDemoView
        model: @hours
      App.contentView.show(@usageBarView)

  showTodosView: ->
    @switchTab('todosview')

    if @todosView
      App.contentView.show(@todosView)
    else
      @loadingIndicator = new Cartilage.Views.LoadingIndicatorView
      @loadingIndicator.start()
      App.contentView.show(@loadingIndicator)

      @todosView = new App.Views.TodosView
      App.contentView.show(@todosView)
