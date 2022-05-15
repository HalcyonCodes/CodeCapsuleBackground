import 'dart:html';
import '../fromJsonModel/category_from_json_model.dart' as frModel;
import 'package:dio/dio.dart';
//import '../data/editor_page_data.dart' as tData;
import '../data/category_data.dart' as tData;
import './category.dart';
import './tag.dart';

class CategoryViewModel {
  late List<Category> categories;

  CategoryViewModel();

  Future<int> refresh() async {
    //后期修改请求数据
    Response response;

    response = await Dio().get('http://localhost:4040/');

    if (response.statusCode == HttpStatus.ok) {
      var data = tData.data;
      //EditorModel fromJsonModel = EditorModel.fromJson(data);
      frModel.CategoryModel fromJsonModel =
          frModel.CategoryModel.fromJson(data);
      categories = [];
      for (var e in fromJsonModel.data.categories) {
        Category category = Category(
            categoryId: e.categoryId,
            title: e.title,
            update: e.update,
            count: e.count);
        categories.add(category);
      }

      return HttpStatus.ok;
    } else {
      throw Exception('http加载失败');
    }
  }

  Future<int> addCategory(Map<String, String> data) async{
    Response response;
    //先添加cookie
    //response = await Dio().post('htttp://localhost:4040/', data: data);
    response = await Dio().get('http://localhost:4040/');

    if (response.statusCode == HttpStatus.ok) {
      
      return HttpStatus.ok;
    } else {
      throw Exception('http加载失败');
    }
  }

  Future<int> delCategory(String categoryId) async{
    Response response;
    //先添加cookie
    //response = await Dio().post('htttp://localhost:4040/', data: data);
    response = await Dio().get('http://localhost:4040/');

    if (response.statusCode == HttpStatus.ok) {
      
      return HttpStatus.ok;
    } else {
      throw Exception('http加载失败');
    }
  }

   Future<int> updateCategory(Map<String, String> data) async{
    Response response;
    //先添加cookie
    //response = await Dio().post('htttp://localhost:4040/', data: data);
    response = await Dio().get('http://localhost:4040/');

    if (response.statusCode == HttpStatus.ok) {
      return HttpStatus.ok;
    } else {
      throw Exception('http加载失败');
    }
  }

}
