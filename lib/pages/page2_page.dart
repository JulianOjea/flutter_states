import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states/bloc/user/user_bloc.dart';
import 'package:flutter_states/models/user.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
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
                  userBloc.add(ActivateUser(
                      user: User(
                          name: "Adam",
                          age: 30,
                          professions: ["Albañil", "Tendero"])));
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Cambiar Edad',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userBloc.add(ChangeUserAge(25));
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Añadir Profesión',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  userBloc.add(AddProfession("Nueva Profesion"));
                })
          ],
        ),
      ),
    );
  }
}
