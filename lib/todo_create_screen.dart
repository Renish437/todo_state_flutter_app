import 'package:flutter/material.dart';

class CreateTodoScreen extends StatelessWidget {
  @override
  Function onSubmit;
  CreateTodoScreen(this.onSubmit);
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var subtitleController = TextEditingController();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 101, 55, 227),
        centerTitle: true,
        title: Text("Create Todo App", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.all(20),

        child: Column(
          spacing: 20,

          children: [
            Container(
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  
                  ),
              ),
            ),
            Container(
              child: TextField(
                controller: subtitleController,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),

            Align(
              alignment: Alignment.center,
              
              child: ElevatedButton(
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 101, 55, 227),
                padding: EdgeInsets.only(right: 40, left: 30),
              ),

              onPressed: () {
               
                onSubmit(titleController.value.text,subtitleController.value.text);
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                
                spacing: 5,
                children: [
                  Icon(Icons.add, color: Colors.white),
                  Text('Save', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
