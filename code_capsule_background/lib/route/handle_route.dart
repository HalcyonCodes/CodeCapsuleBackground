import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../editPage/edit_page.dart';
import '../homePage/page_home.dart';

//1.主页
Handler homePageHandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  //Navigator.pop(context!);
  String headImg =
      'https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0314%2F9dbaa7d9j00qpy1dg001wd200rs00rsg005t005t.jpg&thumbnail=660x2147483647&quality=80&type=jpg';
  return HomePage(
    headImg: headImg,
  );
});

//编辑
Handler editPageHandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String headImg =
      'https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0314%2F9dbaa7d9j00qpy1dg001wd200rs00rsg005t005t.jpg&thumbnail=660x2147483647&quality=80&type=jpg';
  return EditPage(
    headImg: headImg,
  );
});
