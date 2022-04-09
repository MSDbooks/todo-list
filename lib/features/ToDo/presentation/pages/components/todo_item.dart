import 'package:clean_arquitecture/features/ToDo/infra/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todo;
  final void Function() onTap;
  const TodoItem({ Key? key, required this.todo, required this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(),
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      title: Text(
        todo.name, 
        style: !todo.concluded 
               ? null
               : const TextStyle(
                  color: Colors.black54,
                  decoration: TextDecoration.lineThrough
                ),
      ),
      
    );
  }
}