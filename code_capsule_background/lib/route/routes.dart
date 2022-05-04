import 'package:fluro/fluro.dart';
import './handle_route.dart';
import 'package:flutter/material.dart';

class Routes {
  static String root = '/';
  //------page-------------
  //1
  static String homePage = '/homePage';
  static String editPage = '/editPage';


  //-----------------------------
  static void configureRotes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        print('ERROR==>ROUTE WAS NOT FOUND!!');
        print('找不到路由， 404');
        return null;
    });

    //----路由配置-----
    //0.主页
    router.define(root, handler: homePageHandle);
    //1.首页
    router.define(homePage, handler: homePageHandle);
    //2.编辑
    router.define(editPage, handler: editPageHandle);

  }
}
