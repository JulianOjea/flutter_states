import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states/bloc/user/user_bloc.dart';
import 'package:flutter_states/models/user.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<UserBloc>(context, listen: false)
                    .add(DeleteUser());
              },
              icon: const Icon(Icons.delete_outline))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.existsUser
              ? UserData(user: state.user!)
              : const Center(
                  child: Text("No hay usuario seleccionado"),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessible_forward_sharp),
        onPressed: () {
          Navigator.pushNamed(context, 'page2');
        },
      ),
    );
  }
}

class UserData extends StatelessWidget {
  final User user;
  const UserData({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double
          .infinity, // el infinity es para que coja todo el tamaño que pueda
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(title: Text('Nombre: ${user.name}')),
          ListTile(title: Text('Edad: ${user.age}')),
          const Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...user.professions.map((p) => ListTile(title: Text(p))).toList()
        ],
      ),
    );
  }
}
