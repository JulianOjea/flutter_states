import 'package:flutter/material.dart';
import 'package:flutter_states/models/user.dart';
import 'package:flutter_states/services/user_service.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
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
                  final nuevoUsuario =
                      User(name: 'Adam', age: 30, professions: []);
                  userService.loadUser(nuevoUsuario);
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Cambiar Edad',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userService.updateAge(84);
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Añadir Profesión',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
