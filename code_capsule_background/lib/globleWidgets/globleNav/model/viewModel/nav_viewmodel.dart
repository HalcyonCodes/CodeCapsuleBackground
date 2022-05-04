import 'dart:io';

import '../fromJsonModel/nav_model.dart';
import 'package:dio/dio.dart';

import '../data/nav_data.dart' as data;

class NavViewModel{
  late String code;
  late String message;
  late Response? response;
  late String headImg;

  NavViewModel();
  //item点击后

  Future<int>? refresh() async {
    response = null;

    //1.根据currentArtticleID发起dio请求
    //

    try{
      response = await Dio().get('http://localhost:4040/');
   
      //请求成功
      if (response!.statusCode == HttpStatus.ok) {
        //2.模拟加载数据
        //var data = response.data;
         //2.模拟加载数据
        //var data = response.data;
        var tData = data.data;
        //3.解析数据
        //TagTitleModel tagTitleModel = TagTitleModel.fromJson(tData);
        //ContentModel contentModel = ContentModel.fromJson(tData);
        NavModel model = NavModel.fromJson(tData);
      //4.绑定数据
        code = model.code;
        message = model.message;
        headImg = model.data.headImg;
      //currentArticleId = '';
        return response!.statusCode!;
      } else {
      //currentArticleId = '';
        headImg = ''; //改为默认头像地址
        return response!.statusCode!;

      }

    }catch(e){
      headImg = ''; //改为默认头像地址
      return 404;
    }


  }
}