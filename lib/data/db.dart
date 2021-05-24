import 'dart:io';

import 'package:docnews/data/daos/article_dao.dart';
import 'package:docnews/data/models/article.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

part 'db.g.dart';

@UseMoor(tables: [
  Articles,
], daos: [
  ArticleDao,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_createDatabase());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _createDatabase() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'app.db'));
    return VmDatabase(file);
  });
}
