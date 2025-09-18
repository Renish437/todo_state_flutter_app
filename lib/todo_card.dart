import 'package:flutter/material.dart';
import 'dart:math';

class TodoCard extends StatefulWidget {
  final String id;
  final String title;
  final String subtitle;
  final void Function(String) onDelete;

  const TodoCard({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.onDelete,
  });

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  Color? cardColor;
  final List<Color> colorList = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.deepPurple
  ];

  @override
  void initState() {
    super.initState();
    cardColor = colorList[Random().nextInt(colorList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: text content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.subtitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          // Right: delete icon
          IconButton(
            onPressed: () => widget.onDelete(widget.id),
            icon: const Icon(Icons.delete),
            color: Colors.white,
            iconSize: 28,
          ),
        ],
      ),
    );
  }
}
