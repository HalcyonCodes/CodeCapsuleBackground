import 'package:code_capsule_background/route/application.dart';
import 'package:code_capsule_background/route/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './homePage/page_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('ddd');
    final router = FluroRouter();
    Routes.configureRotes(router);
    Application.router = router;
    return MaterialApp(
      title: 'Code Capsule Background',
      //theme: ThemeData(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router!.generator,
      onGenerateInitialRoutes: Application.router!.generatorInitail
    );
  }
}


