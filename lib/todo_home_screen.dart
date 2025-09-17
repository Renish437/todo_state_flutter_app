import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'todo_create_screen.dart';
import 'dart:math';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  @override
  List todos = <Map<String, String>>[];
 
  Widget build(BuildContext context) {

   void addItem(String title, String subtitle) {
    setState(() {
      todos.add({"title": title, "subtitle": subtitle});
    });
  }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 101, 55, 227),

        title: Container(
          margin: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text("Todo App", style: TextStyle(color: Colors.white)),
              IconButton(
                onPressed: () {
                
                  Navigator.push(context,MaterialPageRoute(builder: (_)=>CreateTodoScreen(addItem)));
                },
                icon: Icon(Icons.add_circle),
                color: Colors.white,
                iconSize: 30,
              ),
             
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 245, 245, 246),
      body: Padding(
        padding:const EdgeInsets.only(bottom:20),
        child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
        padding: EdgeInsets.only(top: 20),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            spacing: 10,
            children: [
              
             for(var data in todos)...{
              TodoCard(data['title']!,data['subtitle']!)
             }
            
            ],
          ),
        ),
      ),
        ),
    );
  }
}

class TodoCard extends StatefulWidget {
  final String title;
  final String subtitle;

  const TodoCard(this.title, [this.subtitle = "Subtitles",]) : super(key: null);

  @override
  State<TodoCard> createState() => _TodoCardState();
}




class _TodoCardState extends State<TodoCard> {
  get title => this.title;
  
  get subtitle =>this.subtitle;
Color? cardColor;
  List<Color> colorList = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.deepPurple
  ];
  
 
  @override

  void initState() {
    var index =Random().nextInt(colorList.length);
    cardColor = colorList[index];
    super.initState();
  }
 
  
 
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  color: cardColor,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // soft gray/black
                      blurRadius: 20, // soften edges
                      spreadRadius: 2, // slight spread
                      offset: Offset(0, 10), // subtle downward shadow
                    ),
                  ],
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 10,

                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                        ),
                        Text(
                          widget.subtitle,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: ()=>{},
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      iconSize: 30,
                    ),
                  ],
                ),
              );
  }
}

