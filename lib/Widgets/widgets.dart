import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_flutter/Constraints/colors.dart';
import 'package:todo_flutter/models/todo_model.dart';

class Todo_Items extends StatelessWidget {
  final Todo todo;
  final onTodoChange;
  final onDeletItem;

  const Todo_Items(
      {Key? key, required this.todo, this.onTodoChange, this.onDeletItem})
      : super(key: key);

  // const Todo_Items({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
            onTap: () {
              onTodoChange(todo);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            tileColor: Colors.white,
            leading: Icon(
              todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: tdBlue,
            ),
            title: Text(
              todo.todotext!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  decoration: todo.isDone ? TextDecoration.lineThrough : null),
            ),
            trailing: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: tdRed,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                color: Colors.white,
                iconSize: 20,
                icon: Icon(Icons.delete),
                onPressed: () {
                  onDeletItem(todo.id);
                },
              ),
            )));
  }
}
