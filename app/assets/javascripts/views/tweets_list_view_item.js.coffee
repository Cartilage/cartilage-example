class window.App.Views.TweetsListViewItem extends Cartilage.Views.ListViewItem

  prepare: ->
    imageView = new Cartilage.Views.ImageView 
      imageAddress: @model.get('profile_image_url')
    @addSubview imageView, (@$ '.profile-image')