import 'package:KakaoTalk/common/common.dart';

class Chat {
  String? message;
  String? createAt;
  String? userID;
  String? username;
  String? profileimagepath;

  Chat({required this.message, required this.createAt, required this.userID, this.username, this.profileimagepath});
  Chat.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    createAt = json["created_at"];
    userID = json["userid"];
    username = json["nickname"];
    profileimagepath = json['profile_image_path'] != "" ? Common.baseUrl + json['profile_image_path'] : null;
  }
}
