abstract class Endpoints {
  static const _baseUrl = 'https://spaceflightnewsapi.net/api/v2/';

  static String articlesPage(int offset, int limit, String searchTerm) {
    return '$_baseUrl/articles?_start=$offset&_limit=$limit&title_contains=$searchTerm';
  }
}
