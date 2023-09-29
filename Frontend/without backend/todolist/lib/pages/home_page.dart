import 'package:flutter/material.dart';
import 'package:todolist/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text('TO DO')),
      ),
      body: ListView(
        children: [
          ToDoTile(
            taskName: "Make Tutorial",
            taskComplete: true,
            onChanged: (p0) {},
          ),
          ToDoTile(
            taskName: "Do exercise",
            taskComplete: false,
            onChanged: (p0) {},
          ),
        ],
      ),
    );
  }
}
