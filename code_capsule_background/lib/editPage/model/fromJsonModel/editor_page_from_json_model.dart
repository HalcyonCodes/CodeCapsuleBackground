
class EditorModel {
  late String code;
  late String message;
  late EditorModelData data;

  EditorModel();

  EditorModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = EditorModelData.fromJson(json['data']);
  }
}

class EditorModelData {
  late List<String> categories;
  late List<String> tags;
  late Article article;

  EditorModelData();

  EditorModelData.fromJson(Map<String, dynamic> json) {
    if (json['article'] != null) {
      article = Article.fromJson(json['article']);
    }
    categories = json['categories'];
    tags = json['tags'];
  }
}

class Article {
  late String articleId;
  late String date;
  late String category;
  late String title;
  late String profile;
  late String content;
  late List<String> tags;

  Article();

  Article.fromJson(Map<String, dynamic> json) {
    articleId = json['articleId'];
    date = json['date'];
    category = json['category'];
    title = json['title'];
    profile = json['profile'];
    tags = json['tags'];
    content = json['content'];
  }
}
