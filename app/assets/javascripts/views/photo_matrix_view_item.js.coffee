class window.App.Views.PhotoMatrixViewItem extends Cartilage.Views.MatrixViewItem

  initialize: (options) ->
    super(options)
    captionText = @model.get('date_taken')
    captionText = '<span class="file_name">' + @model.get("title") + '</span><span class="file_path">' + captionText + '</span>'
    @templateVariables = { caption_text: captionText }

  prepare: ->
    imageView = new Cartilage.Views.ImageView 
      imageAddress: @model.thumbnailUrl()
    @addSubview imageView, (@$ '.photo-view')
