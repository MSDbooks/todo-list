
import 'package:clean_arquitecture/features/ToDo/domain/usecases/get_todo_list_usecase.dart';
import 'package:clean_arquitecture/features/ToDo/infra/models/todo_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TodoController extends GetxController{

  final IGetTodoListUsecase getTodoListUsecase ;

  TodoController({required this.getTodoListUsecase});

  @override
  void onInit() {
    super.onInit();
    getList();
  }

  var todoList = <TodoModel>[];
  
  Future<void> setTodo(TodoModel _todo) async{ 

    await getTodoListUsecase.addItem(_todo, false);
    todoList.add(_todo);
    todoList.toList(growable: true);
    update();
  }

  Future<void> setTodoDone(TodoModel _todo, bool newStatus) async{
    await getTodoListUsecase.addItem(_todo, true);
    var todoItem = todoList.firstWhere((td) => td == _todo);
    todoItem.concluded = newStatus;
    update();
  }

  Future<void> getList() async{
    todoList = await  getTodoListUsecase.call();
    update();
  }


}