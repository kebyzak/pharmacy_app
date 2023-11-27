class News {
  final int userId;
  final int id;
  final String title;
  final String body;

  News({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
