import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import '../model/todo.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final todolist = ToDo.todolist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdbgColor,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: GoogleFonts.karla(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ), // Google Fonts
                ), //Title
                const SizedBox(height: 7),
                taskTitle(),
                Container(
                    margin: const EdgeInsets.fromLTRB(10, 25, 10, 20),
                    decoration: BoxDecoration(
                        color: tdPaleWhite,
                        borderRadius: BorderRadius.circular(100)),
                    height: 2), //White Line
                Text(
                  "ToDos",
                  style: GoogleFonts.karla(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ), //ToDos
                const SizedBox(height: 7),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 2),
                // dragStartBehavior: DragStartBehavior.down,
                // addAutomaticKeepAlives: false,
                // keyboardDismissBehavior:
                //     ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  for (ToDo todo in todolist)
                    TodoItem(
                      todoForItem: todo,
                      onTodoChanged: _handleToDoChange,
                      onDeleteItem: _handleToDoDelete,
                    ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.only(bottom: 15, right: 30),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  onPressed: () {
                    _addTodoItem(_todoController.text);
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: tdBlue,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.black,
                    iconSize: 32,
                    elevation: 10,
                  ),
                  icon: const Icon(Icons.add_task_rounded),
                )),
          ), //Add Button
        ],
      ),
    ); // Scaffold
  }

  final _todoController = TextEditingController();

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleToDoDelete(String id) {
    setState(() {
      todolist.removeWhere((item) => item.id == id);
    });
  }

  void _addTodoItem(String todo) {
    setState(() {
      todolist.add(ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          todoText: todo));
      _todoController.clear();
    });
  }

  Widget taskTitle() {
    return Container(
      width: 376,
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: tdGrey,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        controller: _todoController,
        textCapitalization: TextCapitalization.words,
        // Cursor Settings
        cursorColor: tdtextColor,
        cursorHeight: 30,
        cursorRadius: const Radius.circular(100),
        cursorOpacityAnimates: true,
        cursorErrorColor: Colors.red,
        // Typed Text Settings
        style: GoogleFonts.karla(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          prefixIcon:
              const Icon(Icons.task_alt_rounded, color: tdBlue, size: 35),
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 50, minWidth: 50),
          border: InputBorder.none,
          hintText: "What would you like to do?",
          hintStyle: GoogleFonts.karla(
            textStyle: const TextStyle(
              color: tdtextColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdbgColor,
      elevation: 0,
      title: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 27,
          ),
          Text(
            " Add Task",
            style: GoogleFonts.karla(
              textStyle: const TextStyle(
                color: tdtextColor,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ), //Google Fonts
          ),
        ],
      ),
    );
  }
} // Class
