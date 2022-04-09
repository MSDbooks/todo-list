
import 'package:clean_arquitecture/features/ToDo/binding/todo_binding.dart';
import 'package:clean_arquitecture/features/home/binding/home_biding.dart';
import 'package:clean_arquitecture/features/home/presentation/pages/home_paGE.dart';
import 'package:get/route_manager.dart';

import '../features/ToDo/presentation/pages/todo_page.dart';

part './app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.home, 
      binding: HomeBinding(),
      page: ()=> const HomePage()
    ),
    GetPage(
      name: Routes.todo, 
      binding: TodoBinding(),
      page: ()=> const TodoPage(),
      children: [
        GetPage(
          name: Routes.todoCreate, 
          binding: TodoBinding(),
          page: ()=> const TodoPage(),
        ),
      ] 
    ),

  ];
}