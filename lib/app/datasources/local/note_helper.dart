import 'package:iesb_college/app/datasources/local/database.dart';
import 'package:iesb_college/app/models/Course.dart';
import 'package:iesb_college/app/models/Note.dart';
import 'package:sqflite/sqflite.dart';

class NoteHelper {
  static const sqlCreate = '''
      CREATE TABLE IF NOT EXISTS ${Note.tableName} (
        ${Note.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Note.columnValue} DOUBLE,
        ${Note.columnCourse} INTEGER
      )
''';

  void inserir(Note categoria) async {
    Database db = await IesbDatabase().db;

    db.insert(Note.tableName, categoria.toMap());
  }

  void atualizar(Note categoria) async {
    Database db = await IesbDatabase().db;

    db.update(Note.tableName, categoria.toMap(),
        where: '${Note.columnValue} = ?', whereArgs: [categoria.id]);
  }

  void excluir(int id) async {
    Database db = await IesbDatabase().db;

    db.delete(Note.tableName, where: '${Note.columnId} = ?', whereArgs: [id]);
  }

  // get todos com inner join
  Future<List<Note>> getTodosInnerJoin() async {
    Database db = await IesbDatabase().db;

    List<Map<String, dynamic>> resultado = await db.rawQuery('''
      SELECT
        ${Note.tableName}.${Note.columnId},
        ${Note.tableName}.${Note.columnValue},
        ${Note.tableName}.${Note.columnCourse},
        ${Course.tableName}.${Course.columnId},
        ${Course.tableName}.${Course.columnName},
        ${Course.tableName}.${Course.columnTeacher},
        ${Course.tableName}.${Course.columnType},
        ${Course.tableName}.${Course.columnMedia}
      FROM ${Note.tableName}
      ORDER BY ${Note.tableName}.${Note.columnValue} ASC
    ''');

    List<Note> lista = resultado.map((e) => Note.fromMapInnerJoin(e)).toList();

    return lista;
  }

  // get todos por id do curso
  Future<List<Note>> getTodosPorCurso(int id) async {
    Database db = await IesbDatabase().db;

    List<Map<String, dynamic>> resultado = await db.query(Note.tableName,
        where: '${Note.columnCourse} = ?', whereArgs: [id]);

    List<Note> lista = resultado.map((e) => Note.fromMap(e)).toList();

    return lista;
  }
}
