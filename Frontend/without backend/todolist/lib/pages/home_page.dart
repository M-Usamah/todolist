import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist/data/database.dart';
import 'package:todolist/util/dialog_box.dart';
import 'package:todolist/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChange(bool? value, int index) {
    setState(
      () {
        db.toDoList[index][1] = !db.toDoList[index][1];
      },
    );
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(
      () {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      },
    );
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Center(child: Text('TO DO')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskComplete: db.toDoList[index][1],
              onChanged: (value) => checkBoxChange(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
