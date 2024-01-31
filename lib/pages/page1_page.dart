// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_states/controllers/user_controller.dart';
import 'package:flutter_states/models/user.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.put(UserController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Page 1'),
        ),
        body: Obx(() => userCtrl.exitsUser.value
            ? UserData(
                user: userCtrl.user.value,
              )
            : NoInfo()),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.accessible_forward_sharp),
          // onPressed: () {
          //   Navigator.pushNamed(context, 'page2');
          // },
          // onPressed: () =>
          //     Get.toNamed('/page2', arguments: {'name': 'Adam', 'age': 30}),
          onPressed: () =>
              Get.toNamed('/page2', arguments: {'name': 'Adam', 'age': 30}),
        ));
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('No hay usuario seleccionado'),
      ),
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
          ...user.professions.map((e) => ListTile(
                title: Text(e),
              ))
        ],
      ),
    );
  }
}
