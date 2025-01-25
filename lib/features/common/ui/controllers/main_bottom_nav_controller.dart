import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainBottomNavController extends GetxController {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    if (index == _selectedIndex) {
      return;
    }
    _selectedIndex = index;
    update();
  }
  void backToHome(){
    changeIndex(0);
  }
  void moveToCategory(){
    changeIndex(1);
  }
}
