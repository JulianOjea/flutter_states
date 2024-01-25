// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_states/models/user.dart';
import 'package:flutter_states/services/user_service.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? Text('Nombre: ${snapshot.data!.name}')
                : const Text(' No hay user');
          },
        ),
      ),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? UserData(user: snapshot.data)
              : const Center(child: Text(' No hay información de usuario'));
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
  final User? user;

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
          ListTile(title: Text('Nombre: ${user?.name}')),
          ListTile(title: Text('Edad ${user?.age}')),
          const Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const ListTile(title: Text('Profesion1')),
          const ListTile(title: Text('Profesion2')),
          const ListTile(title: Text('Profesion3')),
        ],
      ),
    );
  }
}
