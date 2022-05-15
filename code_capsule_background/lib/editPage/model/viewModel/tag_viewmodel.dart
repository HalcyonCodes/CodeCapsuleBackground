import 'dart:html';
import '../fromJsonModel/tag_from_json_model.dart' as frModel;
import 'package:dio/dio.dart';
//import '../data/editor_page_data.dart' as tData;
import './tag.dart';
import '../data/tag_data.dart' as tData;
class TagViewModel {
  late List<Tag> articleTags;

  TagViewModel();

  Future<int> refresh() async {
    //后期修改请求数据
    Response response;

    response = await Dio().get('http://localhost:4040/');

    if (response.statusCode == HttpStatus.ok) {
      var data = tData.data;
      //EditorModel fromJsonModel = EditorModel.fromJson(data);
      frModel.TagModel fromJsonModel = frModel.TagModel.fromJson(data);

      articleTags = [];
      for (var e in fromJsonModel.data.tags) {
        Tag tag = Tag(tagId: e.tagId, title: e.title, date: e.date);
        articleTags.add(tag);
      }

      return HttpStatus.ok;
    } else {
      throw Exception('http加载失败');
    }
  }
}

