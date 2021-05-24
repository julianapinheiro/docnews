// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Article extends DataClass implements Insertable<Article> {
  final String id;
  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;
  final DateTime publishedAt;
  final bool isFavorite;
  Article(
      {required this.id,
      required this.title,
      required this.url,
      required this.imageUrl,
      required this.newsSite,
      required this.summary,
      required this.publishedAt,
      required this.isFavorite});
  factory Article.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Article(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      imageUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url'])!,
      newsSite: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}news_site'])!,
      summary: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}summary'])!,
      publishedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}published_at'])!,
      isFavorite: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_favorite'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['url'] = Variable<String>(url);
    map['image_url'] = Variable<String>(imageUrl);
    map['news_site'] = Variable<String>(newsSite);
    map['summary'] = Variable<String>(summary);
    map['published_at'] = Variable<DateTime>(publishedAt);
    map['is_favorite'] = Variable<bool>(isFavorite);
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      id: Value(id),
      title: Value(title),
      url: Value(url),
      imageUrl: Value(imageUrl),
      newsSite: Value(newsSite),
      summary: Value(summary),
      publishedAt: Value(publishedAt),
      isFavorite: Value(isFavorite),
    );
  }

  factory Article.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Article(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      url: serializer.fromJson<String>(json['url']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      newsSite: serializer.fromJson<String>(json['newsSite']),
      summary: serializer.fromJson<String>(json['summary']),
      publishedAt: serializer.fromJson<DateTime>(json['publishedAt']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'url': serializer.toJson<String>(url),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'newsSite': serializer.toJson<String>(newsSite),
      'summary': serializer.toJson<String>(summary),
      'publishedAt': serializer.toJson<DateTime>(publishedAt),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  Article copyWith(
          {String? id,
          String? title,
          String? url,
          String? imageUrl,
          String? newsSite,
          String? summary,
          DateTime? publishedAt,
          bool? isFavorite}) =>
      Article(
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        imageUrl: imageUrl ?? this.imageUrl,
        newsSite: newsSite ?? this.newsSite,
        summary: summary ?? this.summary,
        publishedAt: publishedAt ?? this.publishedAt,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  @override
  String toString() {
    return (StringBuffer('Article(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('newsSite: $newsSite, ')
          ..write('summary: $summary, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              url.hashCode,
              $mrjc(
                  imageUrl.hashCode,
                  $mrjc(
                      newsSite.hashCode,
                      $mrjc(
                          summary.hashCode,
                          $mrjc(
                              publishedAt.hashCode, isFavorite.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Article &&
          other.id == this.id &&
          other.title == this.title &&
          other.url == this.url &&
          other.imageUrl == this.imageUrl &&
          other.newsSite == this.newsSite &&
          other.summary == this.summary &&
          other.publishedAt == this.publishedAt &&
          other.isFavorite == this.isFavorite);
}

class ArticlesCompanion extends UpdateCompanion<Article> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> url;
  final Value<String> imageUrl;
  final Value<String> newsSite;
  final Value<String> summary;
  final Value<DateTime> publishedAt;
  final Value<bool> isFavorite;
  const ArticlesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.newsSite = const Value.absent(),
    this.summary = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  ArticlesCompanion.insert({
    required String id,
    required String title,
    required String url,
    required String imageUrl,
    required String newsSite,
    required String summary,
    required DateTime publishedAt,
    required bool isFavorite,
  })  : id = Value(id),
        title = Value(title),
        url = Value(url),
        imageUrl = Value(imageUrl),
        newsSite = Value(newsSite),
        summary = Value(summary),
        publishedAt = Value(publishedAt),
        isFavorite = Value(isFavorite);
  static Insertable<Article> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? url,
    Expression<String>? imageUrl,
    Expression<String>? newsSite,
    Expression<String>? summary,
    Expression<DateTime>? publishedAt,
    Expression<bool>? isFavorite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (imageUrl != null) 'image_url': imageUrl,
      if (newsSite != null) 'news_site': newsSite,
      if (summary != null) 'summary': summary,
      if (publishedAt != null) 'published_at': publishedAt,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  ArticlesCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? url,
      Value<String>? imageUrl,
      Value<String>? newsSite,
      Value<String>? summary,
      Value<DateTime>? publishedAt,
      Value<bool>? isFavorite}) {
    return ArticlesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      newsSite: newsSite ?? this.newsSite,
      summary: summary ?? this.summary,
      publishedAt: publishedAt ?? this.publishedAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (newsSite.present) {
      map['news_site'] = Variable<String>(newsSite.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('newsSite: $newsSite, ')
          ..write('summary: $summary, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

class $ArticlesTable extends Articles with TableInfo<$ArticlesTable, Article> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ArticlesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedTextColumn id = _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedTextColumn url = _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  @override
  late final GeneratedTextColumn imageUrl = _constructImageUrl();
  GeneratedTextColumn _constructImageUrl() {
    return GeneratedTextColumn(
      'image_url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _newsSiteMeta = const VerificationMeta('newsSite');
  @override
  late final GeneratedTextColumn newsSite = _constructNewsSite();
  GeneratedTextColumn _constructNewsSite() {
    return GeneratedTextColumn(
      'news_site',
      $tableName,
      false,
    );
  }

  final VerificationMeta _summaryMeta = const VerificationMeta('summary');
  @override
  late final GeneratedTextColumn summary = _constructSummary();
  GeneratedTextColumn _constructSummary() {
    return GeneratedTextColumn(
      'summary',
      $tableName,
      false,
    );
  }

  final VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedDateTimeColumn publishedAt = _constructPublishedAt();
  GeneratedDateTimeColumn _constructPublishedAt() {
    return GeneratedDateTimeColumn(
      'published_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isFavoriteMeta = const VerificationMeta('isFavorite');
  @override
  late final GeneratedBoolColumn isFavorite = _constructIsFavorite();
  GeneratedBoolColumn _constructIsFavorite() {
    return GeneratedBoolColumn(
      'is_favorite',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, url, imageUrl, newsSite, summary, publishedAt, isFavorite];
  @override
  $ArticlesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'articles';
  @override
  final String actualTableName = 'articles';
  @override
  VerificationContext validateIntegrity(Insertable<Article> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('news_site')) {
      context.handle(_newsSiteMeta,
          newsSite.isAcceptableOrUnknown(data['news_site']!, _newsSiteMeta));
    } else if (isInserting) {
      context.missing(_newsSiteMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    } else if (isInserting) {
      context.missing(_publishedAtMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    } else if (isInserting) {
      context.missing(_isFavoriteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Article map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Article.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ArticlesTable createAlias(String alias) {
    return $ArticlesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ArticlesTable articles = $ArticlesTable(this);
  late final ArticleDao articleDao = ArticleDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [articles];
}
