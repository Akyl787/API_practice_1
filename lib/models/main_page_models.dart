class UserInfoModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  UserInfoModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
