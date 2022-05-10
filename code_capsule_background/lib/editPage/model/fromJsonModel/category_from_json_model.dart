class CategoryModel {
  late String code;
  late String message;
  late CategoryModelData data;

  CategoryModel();

  CategoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = CategoryModelData.fromJson(json['data']);
  }
}

class CategoryModelData {

  late List<Category> categories;

  CategoryModelData();

  CategoryModelData.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((e) {
        categories.add(Category.fromJson(e));
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

