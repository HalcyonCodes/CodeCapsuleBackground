class TagModel {
  late String code;
  late String message;
  late TagModelData data;

  TagModel();

  TagModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = TagModelData.fromJson(json['data']);
  }
}

class TagModelData {
  
  late List<Tag> tags;

  TagModelData();

  TagModelData.fromJson(Map<String, dynamic> json) {
    if (json['tags'] != null) {
      tags = [];
      json['tags'].froEach((e) {
        Tag tag = Tag.fromJson(e);
        tags.add(tag);
      });
    }
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
