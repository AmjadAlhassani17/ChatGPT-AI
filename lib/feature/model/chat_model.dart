class ChatModel {
  String? msg;
  int? chatIndex;

  ChatModel({
    required this.msg,
    required this.chatIndex,
  });


  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    msg : json["msg"] as String,
    chatIndex : json["chatIndex"] as int,
  );

  Map<String, dynamic> toJson() => {
    'msg' : msg,
    'chatIndex' : chatIndex,
  };

}
