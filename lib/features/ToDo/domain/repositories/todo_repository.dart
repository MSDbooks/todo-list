import 'package:clean_arquitecture/features/ToDo/infra/datasources/todo_datasource.dart';
import 'package:clean_arquitecture/features/ToDo/infra/models/todo_model.dart';

abstract class ITodoRepository{
  Future<List<TodoModel>> list();
  Future<void> addItem(TodoModel todo, bool update);
}

class TodoRepository implements ITodoRepository{
  final ITodoDatasource datasource;

  TodoRepository({ required this.datasource });
  @override
  Future<List<TodoModel>> list() {
    return datasource.list();
  }

  @override
  Future<void> addItem(TodoModel todo, bool update) {
    return datasource.addItem(todo, update);
  }

}