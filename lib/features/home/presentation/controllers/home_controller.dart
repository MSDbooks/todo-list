import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  var count = 0;


  void increment(){
    count++;
    update();
  }

}