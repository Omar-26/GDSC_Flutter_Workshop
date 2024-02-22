import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoItem extends StatelessWidget {
  final ToDo todoForItem;
  final onTodoChanged;
  final onDeleteItem;

  const TodoItem(
      {super.key,
      required this.todoForItem,
      required this.onTodoChanged,
      required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        // onTap: () {}, for debugging
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        tileColor: tdGrey,
        leading: Container(
          height: 45,
          width: 45,
          padding: const EdgeInsets.all(0),
          child: IconButton(
              onPressed: () {
                onTodoChanged(todoForItem);
              },
              icon: todoForItem.isDone
                  ? const Icon(Icons.check_box, color: tdBlue, size: 30)
                  : const Icon(Icons.check_box_outline_blank,
                      color: tdBlue, size: 30),
              padding: const EdgeInsets.all(0)),
        ),
        trailing: Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {
                onDeleteItem(todoForItem.id);
              },
              icon: const Icon(Icons.highlight_remove_rounded,
                  color: tdRed, size: 28),
              padding: const EdgeInsets.all(0)),
        ),
        title: Text(
          todoForItem.todoText,
          style: GoogleFonts.karla(
            textStyle: TextStyle(
              color: tdtextColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              decoration:
                  todoForItem.isDone ? TextDecoration.lineThrough : null,
              decorationColor: tdtextColor,
              decorationThickness: 3,
            ),
          ),
        ),
      ),
    );
  }
}
