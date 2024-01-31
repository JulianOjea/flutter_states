import 'package:flutter_states/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var exitsUser = false.obs;
  var user = User().obs;

  void loadUser(User user) {
    exitsUser.value = true;
    this.user.value = user;
  }

  void changeAge(int age) {
    this.user.update((val) {
      val!.age = age;
    });
  }

  void addProfession(String profession) {
    this.user.update((val) {
      val!.professions = [...val.professions, profession];
    });
  }

  int get professionCount => user.value.professions.length;
}
