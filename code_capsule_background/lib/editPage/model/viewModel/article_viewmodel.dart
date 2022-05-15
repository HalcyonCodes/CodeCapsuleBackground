import 'dart:html';
import '../fromJsonModel/article_from_json_model.dart' as frModel;
import 'package:dio/dio.dart';
//import '../data/editor_page_data.dart' as tData;
import '../data/article_data.dart' as tData;
import './category.dart';
import './tag.dart';

class ArticleViewModel {
  late String articleId;
  late String articleContent;
  late Category articleCategory;
  late String articleTitle;
  late String articleProfile;
  late String articleDate;
  late List<Tag> articleTags;

  late Category? selectCategory;

  bool _isFromInit = true;
  bool get isFromInit => _isFromInit;
  void setIsFromInit(bool i) {
    _isFromInit = i;
  }

  ArticleViewModel();

  Future<int> refresh() async {
    //后期修改请求数据
    if (!isFromInit) {
      //从左边选择然后刷新的
      return 200;
    }
    Response response;

    response = await Dio().get('http://localhost:4040/');

    if (response.statusCode == HttpStatus.ok) {
      var data = tData.data;
      //EditorModel fromJsonModel = EditorModel.fromJson(data);
      frModel.ArticleModel fromJsonModel = frModel.ArticleModel.fromJson(data);
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
      //if (isFromInit) {
      setSelectCategory(articleCategory);
      //}
      setIsFromInit(true);
      return HttpStatus.ok;
    } else {
      throw Exception('http加载失败');
    }
  }

  void setSelectCategory(Category? category) {
    selectCategory = category;
  }
}
