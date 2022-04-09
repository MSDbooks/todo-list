import 'package:clean_arquitecture/features/ToDo/domain/repositories/todo_repository.dart';
import 'package:clean_arquitecture/features/ToDo/infra/models/todo_model.dart';

abstract class IGetTodoListUsecase{
  Future<List<TodoModel>> call(); 
  Future<void> addItem(TodoModel todo, bool update); 
}

class GetTodoListUsecase implements IGetTodoListUsecase{
  final ITodoRepository repository;

  GetTodoListUsecase({
    required this.repository
  });

  @override
  Future<List<TodoModel>> call() => repository.list();

  @override
  Future<void> addItem(TodoModel todo, update) => repository.addItem(todo, update);

}