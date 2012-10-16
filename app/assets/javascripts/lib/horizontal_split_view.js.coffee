class Cartilage.Views.HorizontalSplitView extends Cartilage.Views.SplitView

 prepare: ->
    @addSubview @firstView, @_firstViewContainer
    @addSubview @secondView, @_secondViewContainer

    if @orientation is 'horizontal'
      @position(($ @_firstViewContainer).height())  
    else
      @position(($ @_firstViewContainer).width())  

  #
  # Sets the position of the divider that separates the two views. In the case
  # of a horizontal split view, this is the height of the secondView. For
  # vertical split views, this is the width of the firstView.
  #
  position: (newPosition, options = {}) =>
    return @_currentPosition unless newPosition?

    if @orientation is "vertical"
      minWidth = parseInt ($ @firstElement).css("min-width")
      maxWidth = parseInt ($ @firstElement).css("max-width")

      if newPosition < minWidth
        newPosition = minWidth
      else if newPosition > maxWidth
        newPosition = maxWidth

      if options["animated"]
        ($ @firstElement).css { left: '' }
        ($ @firstElement).animate { width: newPosition + 'px' }, 250
        ($ @secondElement).css { width: '' }
        ($ @secondElement).animate { left: newPosition + 'px' }, 250
      else
        ($ @firstElement).css { width: newPosition + 'px', left: '' }
        ($ @secondElement).css { left: newPosition + 'px', width: '' }

      ($ @dragElement).css("left", (newPosition - ($ @dragElement).width() / 2) + "px")

    else
      minHeight = parseInt ($ @secondElement).css("min-height")
      maxHeight = parseInt ($ @secondElement).css("max-height")

      if newPosition < minHeight
        newPosition = minHeight
      else if newPosition > maxHeight
        newPosition = maxHeight

      bottomPosition = ($ @el).height() - newPosition

      if options["animated"]
        ($ @firstElement).css { bottom: '' }
        ($ @firstElement).animate { height: bottomPosition + 'px' }, 250
        ($ @secondElement).css { height: '' }
        ($ @secondElement).animate { top: bottomPosition + "px" }, 250
      else
        ($ @firstElement).css { height: bottomPosition + 'px', bottom: '' }
        ($ @secondElement).css { top: bottomPosition + "px", height: '' }

      ($ @dragElement).css("top", (newPosition - ($ @dragElement).height() / 2) + "px")

    @_currentPosition = newPosition
    @trigger("resize")
