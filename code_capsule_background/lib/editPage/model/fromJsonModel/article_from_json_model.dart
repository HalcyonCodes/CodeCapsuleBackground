class ArticleModel {
  late String code;
  late String message;
  late ArticleModelData data;

  ArticleModel();

  ArticleModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = ArticleModelData.fromJson(json['data']);
  }
}

class ArticleModelData {
  
  late Article article;

  ArticleModelData();

  ArticleModelData.fromJson(Map<String, dynamic> json) {
    if (json['article'] != null) {
      article = Article.fromJson(json['article']);
    }
  }
}

class Article {
  late String articleId;
  late String date;
  late Category category;
  late String title;
  late String profile;
  late String content;
  late List<Tag> tags;

  Article();

  Article.fromJson(Map<String, dynamic> json) {
    articleId = json['articleId'];
    date = json['date'];
    title = json['title'];
    profile = json['profile'];
    content = json['content'];
    if (json['category'] != null) {
      category = Category.fromJson(json['category']);
    }
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((e) {
        Tag tag = Tag.fromJson(e);
        tags.add(tag);
      });
    }
  }
}

class Category {
  late String categoryId;
  late String title;
  late String update;
  late String count;

  Category();

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    title = json['title'];
    update = json['update'];
    count = json['count'];
  }
}

class Tag {
  late String tagId;
  late String title;
  late String date;

  Tag();

  Tag.fromJson(Map<String, dynamic> json) {
    tagId = json['tagId'];
    title = json['title'];
    date = json['date'];
  }
}
