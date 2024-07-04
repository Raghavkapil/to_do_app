import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/model/todo.dart';
import 'package:to_do_app/widgets/appbar.dart';
import 'package:to_do_app/widgets/item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _todoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        body: CustomScrollView(slivers: <Widget>[
          MyAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  for (ToDo todo in todosList)
                    ToDoItem(
                      todo: todo,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: _deleteToDoItem,
                    ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: tdGrey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                          hintText: "What to do next...",
                          border: InputBorder.none),
                    ),
                  ),
                  ElevatedButton.icon(
                    label: const Text('Add Item'),
                    icon: Icon(
                      Icons.add_circle,
                      size: 25,
                      color: tdBlue,
                    ),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
