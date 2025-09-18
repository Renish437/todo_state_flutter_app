import 'package:flutter/material.dart';
import 'todo_home_screen.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Brightness brightness = Brightness.light;
  
  

  void changeMode() {
    setState(() {
      brightness =
          (brightness == Brightness.light) ? Brightness.dark : Brightness.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoHomeScreen(
        changeMode: changeMode,
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: brightness,
          seedColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
