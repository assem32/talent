class CommentModel{
  String ?name;
  String ?uId;
  String ? dateTime;
  String ? text;

  CommentModel({
    this.name,
    this.uId,
    this.dateTime,
    this.text,
  });
  CommentModel.fromJson(Map<String,dynamic>? json){
    name=json!['name'];
    uId=json['uId'];
    dateTime=json['dateTime'];
    text=json['text'];
  }
  Map<String,dynamic>toMap(){
    return {
      'name': name,
      'uId': uId,
      'dateTime':dateTime,
      'text':text,

    };
  }
}