class window.App.Views.TweetsListViewItem extends Cartilage.Views.ListViewItem

  prepare: ->
    imageView = new Cartilage.Views.ImageView
      imageAddress: @model.profileImageUrl
    @addSubview imageView, (@$ '.profile-image')
