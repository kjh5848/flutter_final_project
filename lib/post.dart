class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Post.fromMap(Map<String, dynamic> body)
      : userId = body["userId"],
        id = body["id"],
        title = body["title"],
        body = body["body"];

  Map<String, dynamic> toMap() {
    return {"userId": userId, "id": id, "title": title, "body": body};
  }
}
