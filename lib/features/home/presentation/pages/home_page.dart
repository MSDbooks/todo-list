

import 'package:clean_arquitecture/features/home/presentation/controllers/home_controller.dart';
import 'package:clean_arquitecture/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class HomePage extends GetView<HomeController> {

  const HomePage({Key? key}): super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            GetBuilder<HomeController>(
              builder: (_) => 
              Text(
              controller.count.toString(),
              style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: 
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                 heroTag: 'btn1',
                  onPressed: () => Get.toNamed(
                  Routes.todo
                ),
                child: const Text('Todo'),
              ),
              FloatingActionButton(
                heroTag: 'btn2',
                onPressed: () => controller.increment(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        )
    );
  }
}