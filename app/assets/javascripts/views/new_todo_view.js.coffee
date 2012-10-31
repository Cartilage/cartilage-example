class window.App.Views.NewTodoView extends Cartilage.Views.ModalView

  events: _.extend {
    "click #create-todo": "createTodo"
    'keypress input[name=todo]': 'handleSpecialKeys'
    "click .cancel": "hide"
  }, Cartilage.Views.ModalView.prototype.events

  initialize: (options) ->
    @parentView = options['parentView']
    super(options)

  handleSpecialKeys: (e) ->
    if e.keyCode == 27
      @hide()
    if e.keyCode != 13
      return true
    @createTodo()
    return false

  createTodo: (e) ->
    todoText = $('#todo').val()
    if todoText
      @collection.add(new App.Models.Todo({ title: todoText }))
    @hide()
