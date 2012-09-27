class window.App.Views.EmptyView extends Cartilage.View

  initialize: (options) ->
    # Load the Template
    @message  = options['message'] ? 'Loading...'
    @templateVariables = { message: @message } 
    super(options)

  setMessage: (message) ->
    @templateVariables.message = message
    @render()
