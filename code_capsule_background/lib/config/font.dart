import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './color.dart';

class KFont{
  //用户名称字体
  static TextStyle userNameStyle = const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 25/18
  );
  
  //导航栏字体
  static TextStyle navStyle = const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 25/18
  );


   //列表刷新指示器字体
  static TextStyle loadStatuStyle = const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 14 / 14,
  );

  //标题卡片顶部分类字体
  static TextStyle articleTitleCardCategoryStyle = const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    height: 17 / 12,
  );

  //--标题卡片顶部日期字体
  static TextStyle articleTitleCardDateStyle = TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 12,
    color: KColor.greyTextColor,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    height: 17 / 12,
  );

  //--标题卡片标题字体
  static TextStyle articleTitleStyle = const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 25 / 18,
  );

  //--标题卡片简介字体
  static TextStyle articleTitleCardProfilesStyle = TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 14,
    color: KColor.greyTextColor,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    height: 20 / 14,
  );

  //--标题卡片标签字体
  static TextStyle articleTitleCardTagStyle = const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    height: 14 / 14,
  );

  //--标题显示页数和数量的字体
  static TextStyle articleTitleCountStyle = const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 17 / 12,
  );

  //--搜索栏字体
  static TextStyle searchBarStyle = const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 18,
    color: Colors.black,
    decoration: TextDecoration.none,
    height: 22 / 18,
  );

  //--搜索栏提示字体
  static TextStyle searchBarInitStyle = TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 18,
    color: KColor.greyTextColor,
    decoration: TextDecoration.none,
    height: 22 / 18,
  );

  //分类里标题栏标题字体
   static TextStyle categoryTitleStyle =  const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 25/18,);

  //分类里标题栏显示次要信息的字体
   static TextStyle categoryProfilesStyle = TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 14,
    color: KColor.greyTextColor,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    height: 20/14,);


   //标签显示页数和数量的字体
   static TextStyle tagTitleCountStyle = const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 17/12,
  );

  //标签标题里标题字体
   static TextStyle tagTitleStyle =  const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 25/18,);

  //标签标题里创建时间字体
   static TextStyle tagDateStyle = TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 12,
    color: KColor.greyTextColor,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    height: 17/12,
  );

  //归档里日历年分和卡片月分标题字体
  static TextStyle filingYearTitleStyle =  const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 25/18,);

  //归档卡片里热度指示字体
   static TextStyle hotTitleStyle = const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 10,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    height: 14/10,
  );
  
  //归档里卡片月分标题字体
  static TextStyle filingMonthTitleStyle =  const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 25/18,);

   //归档里文章个数字体
   static TextStyle filingArticleCountStyle = TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 12,
    color: KColor.greyTextColor,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    height: 17/12,
  );

  //归档卡片里日期指示器星期字体
   static TextStyle filingCardWeekStyle = const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 8,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    height: 11/8,
  );
  
  //归档弹出框字体
  static TextStyle filingPupStyle = const TextStyle(
    fontFamily: 'PingFangHK',
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    height: 20/14,);

}