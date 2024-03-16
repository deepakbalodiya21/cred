import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  final selectedIndex = 0.obs;

  void updateSelectedIndex(int index) => selectedIndex.value = index;
}
