import 'package:drift/drift.dart';

class WikiEntry extends Table{
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get authorId => text()();

  

  DateTimeColumn get created => dateTime()();
  DateTimeColumn get lastUpdated => dateTime()();
}