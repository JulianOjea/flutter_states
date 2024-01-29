import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states/bloc/user/user_cubit.dart';
import 'package:flutter_states/models/user.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();

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
                  final newUser = User(
                      name: "Adam",
                      age: 30,
                      professions: ['Albañil', 'Barrendero']);
                  userCubit.selectUser(newUser);
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Cambiar Edad',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userCubit.changeAge(80);
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Añadir Profesión',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userCubit.addProffession();
                })
          ],
        ),
      ),
    );
  }
}
