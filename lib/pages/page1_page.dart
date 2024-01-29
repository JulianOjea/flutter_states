// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_states/bloc/user/user_cubit.dart';
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
              onPressed: () => context.read<UserCubit>().deleteUser(),
              icon: Icon(Icons.delete))
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessible_forward_sharp),
        onPressed: () {
          Navigator.pushNamed(context, 'page2');
        },
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UserInitial:
            return const Center(
              child: Text('No hay informacion del usuario'),
            );
          case UserActive:
            return UserData(user: (state as UserActive).user);
          default:
            return const Center(child: Text('Estado no reconocido'));
        }

        // if (state is UserInitial) {
        //   return const Center(
        //     child: Text('No hay informacion del usuario'),
        //   );
        // } else if (state is UserActive) {
        //   return UserData(user: state.user);
        // } else {
        //   return const Center(child: Text('Estado no reconocido'));
        // }
      },
    );
  }
}

class UserData extends StatelessWidget {
  final User user;
  const UserData({
    Key? key,
    required this.user,
  }) : super(key: key);

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
          ...user.professions.map((e) => ListTile(title: Text(e))).toList()
        ],
      ),
    );
  }
}
