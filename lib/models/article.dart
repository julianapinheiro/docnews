class Article {
  final String? id;
  final String? title;
  final String? url;
  final String? imageUrl;
  final String? newsSite;
  final String? summary;
  final DateTime? publishedAt;

  Article(
      {this.id,
      this.title,
      this.url,
      this.imageUrl,
      this.newsSite,
      this.summary,
      this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      imageUrl: json['imageUrl'],
      newsSite: json['newsSite'],
      summary: json['summary'],
      publishedAt: DateTime.parse(json['publishedAt']),
    );
  }
}
