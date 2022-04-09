import 'package:clean_arquitecture/features/ToDo/domain/entities/todo_entity.dart';

class TodoModel extends ITodoEntity {
  TodoModel({
    required String name,
    required bool concluded
  }) : super (
    name: name,
    concluded: concluded
  );

  TodoModel.fromJson(Map<String, dynamic> json) : super.fromJson(json);
  
 @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'concluded': concluded
    };
  }
}