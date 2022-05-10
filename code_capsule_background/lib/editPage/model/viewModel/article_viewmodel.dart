import 'dart:html';
import '../fromJsonModel/article_from_json_model.dart';
import 'package:dio/dio.dart';
//import '../data/editor_page_data.dart' as tData;
import '../data/article_data.dart' as tData;

class ArticleViewModel {
  late String articleId;
  late String articleContent;
  late Category articleCategory;

  late String articleTitle;
  late String articleProfile;
  late String articleDate;

  late List<Tag> articleTags;

  ArticleViewModel();

  Future<int> refresh() async {
    //后期修改请求数据
    Response response;

    response = await Dio().get('http://localhost:4040/');

    if (response.statusCode == HttpStatus.ok) {
      var data = tData.data;
      //EditorModel fromJsonModel = EditorModel.fromJson(data);
      ArticleModel fromJsonModel = ArticleModel.fromJson(data);
      articleId = fromJsonModel.data.article.articleId;
      articleContent = fromJsonModel.data.article.content;
      articleCategory = Category(
          categoryId: fromJsonModel.data.article.category.categoryId,
          title: fromJsonModel.data.article.category.title,
          update: fromJsonModel.data.article.category.update,
          count: fromJsonModel.data.article.category.count);
      articleTitle = fromJsonModel.data.article.title;
      articleProfile = fromJsonModel.data.article.profile;
      articleDate = fromJsonModel.data.article.date;
      articleTags = [];
      for (var e in fromJsonModel.data.article.tags) {
        Tag tag = Tag(tagId: e.tagId, title: e.title, date: e.date);
        articleTags.add(tag);
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

class Tag {
  late String tagId;
  late String title;
  late String date;

  Tag({
    required this.tagId,
    required this.title,
    required this.date,
  });
}
