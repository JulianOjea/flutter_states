import 'package:flutter/material.dart';
import 'package:flutter_states/models/user.dart';
import 'package:flutter_states/services/user_service.dart';
import 'package:provider/provider.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: userService.exitsUser
            ? Text(userService.user!.name)
            : Text('Page 2'),
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
                  final newUser = User(
                      name: 'Adam',
                      age: 30,
                      professions: ['Albañil', 'Fontanero']);

                  userService.user = newUser;
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Cambiar Edad',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userService.changeAge(80);
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Añadir Profesión',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userService.addProfession();
                })
          ],
        ),
      ),
    );
  }
}
