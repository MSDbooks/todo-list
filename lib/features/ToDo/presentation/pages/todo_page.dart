import 'package:clean_arquitecture/features/ToDo/infra/models/todo_model.dart';
import 'package:clean_arquitecture/features/ToDo/presentation/controllers/todo_controller.dart';
import 'package:clean_arquitecture/features/ToDo/presentation/pages/components/todo_item.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TodoPage extends GetView<TodoController> {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _txtController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clicar na tarefa p/ finalizar'),
      ),
      body: GetBuilder<TodoController>(
          builder: (_) => 
            ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: controller.todoList.map((TodoModel item) {
                return TodoItem(
                todo: item, 
                onTap: ()=> {
                  controller.setTodoDone(
                    item, 
                    item.concluded = !item.concluded
                  )
                }
              ); 
            }).toList(),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _displayDialog(context, _txtController),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _displayDialog(BuildContext context, TextEditingController _txtController) async {
    return showDialog<void>(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Add novo item'),
          content: TextField(
            controller: _txtController,
            decoration: const InputDecoration(
              hintText: 'digite a nova tarefa'
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                controller.setTodo(
                  TodoModel(
                    name: _txtController.text, 
                    concluded: false)
                  );
              }, 
            ),
          ],
        );
      }
    );
  }

}

