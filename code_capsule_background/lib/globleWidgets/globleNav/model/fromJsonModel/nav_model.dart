class NavModel{
  late String code;
  late String message;
  late NavData data;
  
  NavModel();

  NavModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = NavData.fromJson(json['data']);
    }
  }

}


class NavData{

  late String headImg;
 
  NavData();

  NavData.fromJson(Map<String, dynamic> json){
    headImg = json['headImg'];
  }

}

