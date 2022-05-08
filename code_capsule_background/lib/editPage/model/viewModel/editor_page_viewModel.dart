import 'dart:html';
import 'package:dio/dio.dart';
import '../data/editor_page_data.dart' as tData;
import '../fromJsonModel/editor_page_from_json_model.dart';

class EditorPageViewModel {
  late String articleId;
  late String articleContent;
  late String articleCategory;
  late String articleTitle;
  late String articleProfile;
  late String articleDate;
  late List<String> articleTags;
  late List<String> categories;
  late List<String> tags;

  EditorPageViewModel();

  Future<int> refresh() async {
    
    //后期修改请求数据
    Response response;

    response = await Dio().get('http://localhost:4040/');

    if (response.statusCode == HttpStatus.ok) {
      var data = tData.data;
      EditorModel fromJsonModel = EditorModel.fromJson(data);
      articleId = fromJsonModel.data.article.articleId;
      articleContent = fromJsonModel.data.article.content;
      articleCategory = fromJsonModel.data.article.category;
      articleTitle = fromJsonModel.data.article.title;
      articleProfile = fromJsonModel.data.article.profile;
      articleDate = fromJsonModel.data.article.date;
      articleTags = fromJsonModel.data.article.tags;
      tags = fromJsonModel.data.tags;
      categories = fromJsonModel.data.categories;
      return HttpStatus.ok;
    } else {
      return 404;
    }
  }
}
