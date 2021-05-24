import 'package:docnews/data/db.dart';
import 'package:moor/moor.dart';

class Articles extends Table {
  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get url => text()();

  TextColumn get imageUrl => text()();

  TextColumn get newsSite => text()();

  TextColumn get summary => text()();

  DateTimeColumn get publishedAt => dateTime()();

  BoolColumn get isFavorite => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

Article articlefromJson(Map<String, dynamic> json) {
  return Article(
    id: json['id'],
    title: json['title'],
    url: json['url'],
    imageUrl: json['imageUrl'],
    newsSite: json['newsSite'],
    summary: json['summary'],
    publishedAt: DateTime.parse(json['publishedAt']),
    isFavorite: false,
  );
}
