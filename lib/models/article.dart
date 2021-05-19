class Article {
  final String? id;
  final bool? featured;
  final String? title;
  final String? url;
  final String? imageUrl;
  final String? newsSite;
  final String? summary;
  final DateTime? publishedAt;

  Article(
      {this.id,
      this.featured,
      this.title,
      this.url,
      this.imageUrl,
      this.newsSite,
      this.summary,
      this.publishedAt});
}
