import 'package:flutter/material.dart';
import 'package:todo_flutter/Constraints/colors.dart';
import 'package:todo_flutter/Widgets/widgets.dart';
import 'package:todo_flutter/models/todo_model.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoslist = Todo.todoList();
  List<Todo> _found = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _found = todoslist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildappBar(),
      body: Stack(
        children: [
          Container(
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
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                      for (Todo todo in _found)
                        Todo_Items(
                          todo: todo,
                          onTodoChange: _handlechange,
                          onDeletItem: _deleteHandler,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                        hintText: 'ADD NEW TODO ITEM',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 40),
                  ),
                  onPressed: () {
                    _todoControl(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  void _handlechange(Todo todo) {
    setState(() {});
    todo.isDone = !todo.isDone;
  }

  void _deleteHandler(String id) {
    setState(() {
      todoslist.removeWhere((item) => item.id == id);
    });
  }

  void _todoControl(String todo) {
    todoslist.add(Todo(
        id: DateTime.now().microsecondsSinceEpoch.toString(), todotext: todo));
    _todoController.clear();
  }

  void _runfilter(String keypress) {
    List<Todo> _result = [];
    if (keypress.isEmpty) {
      _result = todoslist;
    } else {
      _result = todoslist
          .where((todo) =>
              todo.todotext!.toLowerCase().contains(keypress.toLowerCase()))
          .toList();
    }
    setState(() {
      _found = _result;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        
        onChanged: (value) {
          _runfilter(value);
        },
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
