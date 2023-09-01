import 'package:aesapp/objects/wiki.dart';
import 'package:drift/drift.dart';
import 'package:logging/logging.dart';

part 'database.g.dart';

final Logger log = Logger("Database");

@DriftDatabase(tables: [
  WikiEntry
])
class Database extends _$Database{
  Database(super.e);

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => throw UnimplementedError();

}