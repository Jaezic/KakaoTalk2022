import 'package:KakaoTalk/models/post_user_login_response.dart';

class GetRoomResponse {
  String? message;
  Room? room;
  GetRoomResponse({this.message, this.room});

  GetRoomResponse.fromJson(Map<String, dynamic> json) {
    message = json.toString();
    room = Room.fromJson(json);
  }
}

class Room {
  String? title;
  String? roomId;
  String? createUserId;
  int? onetoone;
  List<User>? users;
  String? updateAt;
  String? latest_message;
  Room({required this.title, required this.roomId, required this.createUserId, required this.onetoone, required this.users});
  Room.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    roomId = json['roomId'];
    createUserId = json['createUserId'];
    onetoone = int.parse(json['onetoone'] ?? '1');
    updateAt = json['update_at'];
    latest_message = json['latest_message'];

    List<User> userlist = [];
    for (var element in (json['users'] as List)) {
      userlist.add(User.fromJson(element));
    }
    users = userlist;
  }
}
