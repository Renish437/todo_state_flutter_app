import 'package:flutter/material.dart';
import 'dart:math';
import 'todo_create_screen.dart';
import 'todo_card.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key,required this.changeMode});
  final Function changeMode;
  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  List<Map<String, String>> todos = [];

  void addItem(String title, String subtitle) {
    setState(() {
      todos.add({
        "id": DateTime.now().millisecondsSinceEpoch.toString(),
        "title": title,
        "subtitle": subtitle,
      });
    });
  }

  void deleteItem(String id) {
    setState(() {
      todos.removeWhere((todo) => todo['id'] == id);
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.deepPurple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Todo App", style: TextStyle(color: Colors.white)),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateTodoScreen(addItem),
                  ),
                );
              },
              icon: const Icon(Icons.add_circle, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              children: [
                for (var data in todos)
                  TodoCard(
                    key: ValueKey(data['id']),
                    id: data['id']!,
                    title: data['title']!,
                    subtitle: data['subtitle']!,
                    onDelete: deleteItem,
                  ),
              ],
            ),
          ),
        ),
      
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        widget.changeMode();
      }, child:Icon(Icons.light)),
    );
  }
}
