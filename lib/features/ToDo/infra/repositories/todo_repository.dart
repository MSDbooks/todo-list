import 'package:clean_arquitecture/features/ToDo/domain/repositories/todo_repository.dart';
import 'package:clean_arquitecture/features/ToDo/infra/datasources/todo_datasource.dart';
import 'package:clean_arquitecture/features/ToDo/infra/models/todo_model.dart';

class TodoRepository implements ITodoRepository {
  final ITodoDatasource datasource;
  TodoRepository({
    required this.datasource
  });
  @override
  Future<List<TodoModel>> list() async {
    var result = await datasource.list();
    return result;
  }

  @override
  Future<void> addItem(TodoModel todo, bool update) {
    return datasource.addItem(todo, update);
  }

}