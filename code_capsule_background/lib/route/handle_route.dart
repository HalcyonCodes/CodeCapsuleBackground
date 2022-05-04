import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../editPage/edit_page.dart';
import '../homePage/page_home.dart';

//1.主页
Handler homePageHandle = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  print('jiazaizhuye');
  //Navigator.pop(context!);
  return HomePage();
});

//编辑
Handler editPageHandle = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params){

  return EditPage();
});
