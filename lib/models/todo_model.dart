class Todo {
  String? id;
  String? todotext;
  bool isDone=false;
  Todo({
    required this.id,
    required this.todotext,
    this.isDone = false,
  });
  static  List<Todo> todoList() {
    return [
      Todo(id: '01', todotext: 'Morning Mail', isDone: true),
      Todo(id: '02', todotext: 'Buy grocery', isDone: true),
      Todo(id: '03', todotext: 'Check Mails'),
      Todo(id: '04', todotext: 'Team Meeting'),
      Todo(id: '05', todotext: 'Work on Mobile'),
      Todo(id: '06', todotext: 'Dinner Date'),
    ];
  }
}
