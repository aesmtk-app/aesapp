// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $WikiEntryTable extends WikiEntry
    with TableInfo<$WikiEntryTable, WikiEntryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WikiEntryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorIdMeta =
      const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<String> authorId = GeneratedColumn<String>(
      'author_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, authorId, created, lastUpdated];
  @override
  String get aliasedName => _alias ?? 'wiki_entry';
  @override
  String get actualTableName => 'wiki_entry';
  @override
  VerificationContext validateIntegrity(Insertable<WikiEntryData> instance,
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
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  WikiEntryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WikiEntryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      authorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author_id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $WikiEntryTable createAlias(String alias) {
    return $WikiEntryTable(attachedDatabase, alias);
  }
}

class WikiEntryData extends DataClass implements Insertable<WikiEntryData> {
  final String id;
  final String title;
  final String authorId;
  final DateTime created;
  final DateTime lastUpdated;
  const WikiEntryData(
      {required this.id,
      required this.title,
      required this.authorId,
      required this.created,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['author_id'] = Variable<String>(authorId);
    map['created'] = Variable<DateTime>(created);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  WikiEntryCompanion toCompanion(bool nullToAbsent) {
    return WikiEntryCompanion(
      id: Value(id),
      title: Value(title),
      authorId: Value(authorId),
      created: Value(created),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory WikiEntryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WikiEntryData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      authorId: serializer.fromJson<String>(json['authorId']),
      created: serializer.fromJson<DateTime>(json['created']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'authorId': serializer.toJson<String>(authorId),
      'created': serializer.toJson<DateTime>(created),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  WikiEntryData copyWith(
          {String? id,
          String? title,
          String? authorId,
          DateTime? created,
          DateTime? lastUpdated}) =>
      WikiEntryData(
        id: id ?? this.id,
        title: title ?? this.title,
        authorId: authorId ?? this.authorId,
        created: created ?? this.created,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  @override
  String toString() {
    return (StringBuffer('WikiEntryData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('authorId: $authorId, ')
          ..write('created: $created, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, authorId, created, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WikiEntryData &&
          other.id == this.id &&
          other.title == this.title &&
          other.authorId == this.authorId &&
          other.created == this.created &&
          other.lastUpdated == this.lastUpdated);
}

class WikiEntryCompanion extends UpdateCompanion<WikiEntryData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> authorId;
  final Value<DateTime> created;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const WikiEntryCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.authorId = const Value.absent(),
    this.created = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WikiEntryCompanion.insert({
    required String id,
    required String title,
    required String authorId,
    required DateTime created,
    required DateTime lastUpdated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        authorId = Value(authorId),
        created = Value(created),
        lastUpdated = Value(lastUpdated);
  static Insertable<WikiEntryData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? authorId,
    Expression<DateTime>? created,
    Expression<DateTime>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (authorId != null) 'author_id': authorId,
      if (created != null) 'created': created,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WikiEntryCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? authorId,
      Value<DateTime>? created,
      Value<DateTime>? lastUpdated,
      Value<int>? rowid}) {
    return WikiEntryCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      authorId: authorId ?? this.authorId,
      created: created ?? this.created,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
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
    if (authorId.present) {
      map['author_id'] = Variable<String>(authorId.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WikiEntryCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('authorId: $authorId, ')
          ..write('created: $created, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $WikiEntryTable wikiEntry = $WikiEntryTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [wikiEntry];
}
