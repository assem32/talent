class PostModel{
  String ?name;
  String ?uId;
  String ? video;
  String ? thumb;
  String ? dateTime;
  String ? text;

  PostModel({
    this.name,
    this.uId,
    this.video,
    this.dateTime,
    this.text,
    this.thumb,
  });
  PostModel.fromJson(Map<String,dynamic>? json){
    name=json!['name'];
    uId=json['uId'];
    video=json['video'];
    thumb=json['thumb'];
    dateTime=json['dateTime'];
    text=json['text'];
  }
  Map<String,dynamic>toMap(){
    return {
      'name': name,
      'uId': uId,
      'video':video,
      'thumb':thumb,
      'dateTime':dateTime,
      'text':text,
      
    };
  }
}