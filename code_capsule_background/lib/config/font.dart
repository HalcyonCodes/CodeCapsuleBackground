import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './color.dart';

class KFont{
  //每个功能模块中的标题头的字体
  static TextStyle funcTitleStyle = const TextStyle(
    fontFamily: 'pingfang',
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    height: 25/18
  );
  
  //每个功能模块中的标题头的字体
  static TextStyle funcTitleBtnStyle = const TextStyle(
    fontFamily: 'pingfang',
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    height: 0/18
  );

  //编辑功能中选择分类功能中分类卡片的字体
   static TextStyle categoryTitleStyle =  const TextStyle(
    fontFamily: 'pingfang',
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 25/18,);

  //编辑功能中选择分类功能中分类卡片的次信息的字体
    static TextStyle categoryProfilesStyle = TextStyle(
    fontFamily: 'pingfang',
    fontSize: 14,
    color: KColor.greyTextColor,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    height: 20/14,);

  //刷新按钮字体
    static TextStyle refreshBtnStyle = const TextStyle(
    fontFamily: 'pingfang',
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 0/24,);
}