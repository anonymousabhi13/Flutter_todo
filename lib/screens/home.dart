import 'package:flutter/material.dart';
import 'package:todo_flutter/Constraints/colors.dart';
import 'package:todo_flutter/Widgets/widgets.dart';
import 'package:todo_flutter/models/todo_model.dart';

class Home extends StatelessWidget {
   Home({super.key});

  final todoslist = Todo.todoList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildappBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          children: [
            searchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 20),
                    child: Text(
                      "Todo Items",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  for(Todo todo in todoslist)
                  Todo_Items(todo: todo)
                  ,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(0),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: tdGrey,
          ),
          prefixIcon: Icon(Icons.search, color: tdBlack, size: 20),
        ),
      ),
    );
  }

  AppBar _buildappBar() {
    return AppBar(
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),
        Text(
          'Todo',
          style: TextStyle(color: tdBlue),
        ),
      ]),
      centerTitle: true,
      backgroundColor: tdBGColor,
    );
  }
}
