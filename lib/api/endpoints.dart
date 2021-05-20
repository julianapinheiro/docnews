abstract class Endpoints {
  static const _baseUrl = 'https://spaceflightnewsapi.net/api/v2/';

  static String articles(int offset, int limit) {
    return '$_baseUrl/articles?_start=$offset&_limit=$limit';
  }
}
