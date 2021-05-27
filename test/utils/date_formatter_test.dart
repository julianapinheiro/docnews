import 'package:flutter_test/flutter_test.dart';
import 'package:docnews/utils/date_formatter.dart';

void main() {
  group('DateFormatter', () {
    test('dateTime day with one digit', () {
      final date = DateTime(2020, 1, 1);
      final formatted = DateFormatter.toArticleDate(date);

      expect(formatted, 'January 1, 2020');
    });

    test('dateTime day with two digits', () {
      final date = DateTime(2020, 10, 10);
      final formatted = DateFormatter.toArticleDate(date);

      expect(formatted, 'October 10, 2020');
    });
  });
}
