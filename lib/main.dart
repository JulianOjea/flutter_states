import 'package:flutter/material.dart';
import 'package:flutter_states/pages/page1_page.dart';
import 'package:flutter_states/pages/page2_page.dart';
import 'package:get/route_manager.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/page1',
      // routes: {
      //   'page1': (_) => Page1Page(),
      //   'page2': (_) => Page2Page(),
      // },
      getPages: [
        GetPage(name: '/page1', page: () => const Page1Page()),
        GetPage(name: '/page2', page: () => const Page2Page())
      ],
    );
  }
}
