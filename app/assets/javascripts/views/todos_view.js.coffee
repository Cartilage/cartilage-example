class window.App.Views.TodosView extends Cartilage.View

  events:
    "click #add-todo": "todoModal"
    "click #remove-todo": "removeSelectedTodos"
    "click #toggle-todo": "toggleSelectedTodos"

  initialize: (options) ->
    super(options)
    @collection = new App.Collections.Todos([
      new App.Models.Todo({ id: 1, title: 'Build To-do App', completed: yes }), 
      new App.Models.Todo({ id: 2, title: 'Finish Cartilage website', completed: no }),
      new App.Models.Todo({ id: 3, title: 'Review outstanding issues in github', completed: no })
    ])

  prepare: ->
    @todosList = new Cartilage.Views.ListView
      collection: @collection
      itemView: App.Views.TodosListViewItem
      allowsRemove: yes
      allowsMultipleSelection: yes

    @addSubview @todosList, (@$ '#todos-list')
    @observe @todosList, 'select', @enableActionButtons
    @observe @todosList, 'clear', @disableActionButtons

    $('.section-actions li').each (i, el) ->
      $(el).tooltip() # activate Bootstrap tooltips

  disableActionButtons: ->
    $('#remove-todo').addClass("inactive")
    $('#toggle-todo').addClass("inactive")

  enableActionButtons: ->
    $('#remove-todo').removeClass("inactive")
    $('#toggle-todo').removeClass("inactive")

  todoModal: ->
    @newTodoView = new App.Views.NewTodoView
      collection: @collection
    @newTodoView.show()
    $('input#todo').focus()

  removeSelectedTodos: (e) ->
    @todosList.remove(e)
    @todosList.clearSelection()

  # Need to consider observing 'change' on the model
  # so ListView can update itself
  toggleSelectedTodos: (e) ->
    _.each @todosList.selected.models, (model) => model.set({ completed: !model.get('completed') })
    @todosList.update()
