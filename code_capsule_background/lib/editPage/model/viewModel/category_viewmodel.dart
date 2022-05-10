import 'dart:html';
import '../fromJsonModel/category_from_json_model.dart';
import 'package:dio/dio.dart';
//import '../data/editor_page_data.dart' as tData;
import '../data/category_data.dart' as tData;

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
      CategoryModel fromJsonModel = CategoryModel.fromJson(data);
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
}

class Category {
  late String categoryId;
  late String title;
  late String update;
  late String count;

  Category(
      {required this.categoryId,
      required this.title,
      required this.update,
      required this.count});
}
