import 'package:iesb_college/app/datasources/local/course_helper.dart';
import 'package:iesb_college/app/datasources/local/note_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class IesbDatabase {
  static final IesbDatabase _instance = IesbDatabase._internal();

  IesbDatabase._internal();

  factory IesbDatabase() => _instance;

  Database? _db;

  Future<Database> get db async {
    const nameDatabase = 'iesb_college.db';
    final path = await getDatabasesPath();

    final pathDatabase = join(path, nameDatabase);

    return await openDatabase(pathDatabase,
        version: 1, onCreate: _createTables);
  }

  void _createTables(Database db, int version) async {
    await db.execute(CourseHelper.sqlCreate);
    await db.execute(NoteHelper.sqlCreate);
  }

  void close() {
    _db?.close();
  }
}
