import 'package:clean_arquitecture/features/ToDo/domain/repositories/todo_repository.dart';
import 'package:clean_arquitecture/features/ToDo/domain/usecases/get_todo_list_usecase.dart';
import 'package:clean_arquitecture/features/ToDo/infra/datasources/todo_datasource.dart';
import 'package:clean_arquitecture/features/ToDo/presentation/controllers/todo_controller.dart';
import 'package:get/instance_manager.dart';

class TodoBinding extends Bindings{

  @override
  void dependencies() {
    
    Get.lazyPut<TodoController>(
      () => TodoController(
        getTodoListUsecase: Get.find()
      )
    );

    Get.lazyPut<ITodoDatasource>(
      () => TodoDatasource(),
      fenix: true
    );
    Get.lazyPut<ITodoRepository>(
      () => TodoRepository(
        datasource: Get.find()
      ),
      fenix: true
    );
    Get.lazyPut<IGetTodoListUsecase>(
      () => GetTodoListUsecase(
        repository: Get.find()
      ),
      fenix: true
      
    );
  }
  
}