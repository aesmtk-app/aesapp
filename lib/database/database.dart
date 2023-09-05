import 'package:aesapp/objects/vplan.dart';
import 'package:aesapp/objects/wiki.dart';
import 'package:drift/drift.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

part 'database.g.dart';

final Logger log = Logger("Database");

@DriftDatabase(tables: [
  WikiEntry,
  VPlanEntries
])
class Database extends _$Database{
  Database():super(Database._openConnection());
  static Database? _instance;
  static Database getInstance() {
    _instance ??= Database();
    return _instance as Database;
  }
  static LazyDatabase _openConnection() {
    ///open.overrideFor(OperatingSystem.windows, _openOnWindows);
    //open.overrideFor(OperatingSystem.linux, _openOnLinux);
    return LazyDatabase(() async {
      final dbFolder = await getApplicationSupportDirectory();
      //await dbFolder.create(recursive: true);
      log.info(dbFolder.path);
      final dbFile = File(p.join(dbFolder.path, "aesapp.db"));
      return NativeDatabase(dbFile);
    });
  }

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => throw UnimplementedError();

}