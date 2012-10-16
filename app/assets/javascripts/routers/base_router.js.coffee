class window.App.Routers.Base extends Backbone.Router
  routes:
    "": "showAboutView"
    "matrixview": "showMatrixView"
    "listview": "showListView"
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
