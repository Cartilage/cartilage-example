class window.App.Views.TodosView extends Cartilage.View

  events:
    "click #add-todo": "todoModal"
    "click #remove-todo": "removeSelectedTodos"
    "click #complete-todo": "completeSelectedTodos"

  initialize: (options) ->
    super(options)
    @collection = new App.Collections.Todos([
      new App.Models.Todo({ id: 1, title: 'Build To-do App', completed: yes }), 
      new App.Models.Todo({ id: 2, title: 'Finish cartilage website', completed: no }),
      new App.Models.Todo({ id: 3, title: 'Review outstanding issues in github', completed: no })
    ])

  prepare: ->
    @todosList = new Cartilage.Views.ListView
      collection: @collection
      itemView: App.Views.TodosListViewItem
      allowsRemove: yes
      allowsMultipleSelection: yes

    @addSubview @todosList, (@$ '#todos-list')

  todoModal: ->
    @newTodoView = new App.Views.NewTodoView
      collection: @collection
    @newTodoView.show()

  removeSelectedTodos: (e) ->
    @todosList.remove(e) 

  # Need to consider observing 'change' on the model
  # so ListView can update itself
  completeSelectedTodos: (e) ->
    _.each @todosList.selected.models, (model) => model.set({ completed: yes })
    @todosList.update()
