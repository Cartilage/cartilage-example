class window.App.Views.TodosListViewItem extends Cartilage.Views.ListViewItem


  prepare: ->
    ($ @el).addClass('completed') if @model.completed
