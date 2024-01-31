import 'package:flutter/material.dart';
import 'package:flutter_states/controllers/user_controller.dart';
import 'package:flutter_states/models/user.dart';
import 'package:get/get.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    //print(Get.arguments);
    final userCrtl = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                color: Colors.blue,
                child: const Text('Establecer Usuario',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userCrtl.loadUser(User(name: "Adam", age: 30));
                  Get.snackbar(
                      "Usuario establecido", 'Adam es el nombre del usuario',
                      backgroundColor: Colors.white,
                      boxShadows: [
                        const BoxShadow(color: Colors.black38, blurRadius: 10)
                      ]);
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Cambiar Edad',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userCrtl.changeAge(80);
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Añadir Profesión',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userCrtl
                      .addProfession("Albanile ${userCrtl.professionCount}");
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Cambiar tema',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                })
          ],
        ),
      ),
    );
  }
}
