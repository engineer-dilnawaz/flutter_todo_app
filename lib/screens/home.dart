import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textInputController = TextEditingController();
  List todoList = [
    ['Learn Web Development', false],
    ['Drink coffee', false],
    ['Practice Flutter', false],
  ];

  void onChange(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todoList.add([_textInputController.text, false]);
    });
    _textInputController.clear();
  }

  void deleteTaskItem(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text('Simple Todo'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (ctx, index) {
          return TodoItem(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => onChange(index),
            deleteFunction: (ctx) => deleteTaskItem(index),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _textInputController,
                  decoration: InputDecoration(
                    hintText: 'Add new todo',
                    hintStyle: TextStyle(color: Colors.grey.shade50),
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
