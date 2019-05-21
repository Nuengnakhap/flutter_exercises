class Post {
  final int albumId;
  final int id;
  final String title;
  final String thumbnailUrl;
  
  Post({this.albumId, this.id, this.title, this.thumbnailUrl});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}