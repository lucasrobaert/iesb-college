import 'package:iesb_college/app/datasources/local/database.dart';
import 'package:iesb_college/app/models/Course.dart';
import 'package:iesb_college/app/models/Note.dart';
import 'package:sqflite/sqlite_api.dart';

class CourseHelper {
  static const sqlCreate = '''
      CREATE TABLE IF NOT EXISTS ${Course.tableName} (
        ${Course.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Course.columnName} TEXT,
        ${Course.columnTeacher} TEXT,
        ${Course.columnType} INTEGER,
        ${Course.columnMedia} DOUBLE
      )
''';

  void inserir(Course course) async {
    Database db = await IesbDatabase().db;

    db.insert(Course.tableName, course.toMap());
  }

  void atualizar(Course course) async {
    Database db = await IesbDatabase().db;

    db.update(Course.tableName, course.toMap(),
        where: '${Course.columnId} = ?', whereArgs: [course.id]);
  }

  void excluir(int id) async {
    Database db = await IesbDatabase().db;

    db.delete(Course.tableName,
        where: '${Course.columnId} = ?', whereArgs: [id]);
  }

  Future<List<Course>> listAll() async {
    Database db = await IesbDatabase().db;

    List<Map<String, dynamic>> result = await db.query(Course.tableName);

    return result.map((e) => Course.fromMapInnerJoin(e)).toList();
  }

  // get todos com inner join com notas

  Future<List<Course>> listAllInnerJoin() async {
    Database db = await IesbDatabase().db;

    try {
      List<Map<String, dynamic>> result = await db.rawQuery('''
          SELECT
            ${Course.tableName}.${Course.columnId},
            ${Course.tableName}.${Course.columnName},
            ${Course.tableName}.${Course.columnTeacher},
            ${Course.tableName}.${Course.columnType},
            ${Note.tableName}.${Note.columnId},
            ${Note.tableName}.${Note.columnValue}
          FROM ${Course.tableName}
          INNER JOIN ${Note.tableName}
            ON ${Course.tableName}.${Course.columnId} = ${Note.tableName}.${Note.columnCourse}
          ORDER BY ${Course.tableName}.${Course.columnName} ASC
        ''');

      // Adiciona a verificação de resultados
      if (result.isEmpty) {
        return [];
      }

      List<Course> lista = [];
      for (var item in result) {
        final course = Course.fromMapInnerJoin(item);
        lista.add(course);
      }

      return lista;
    } catch (e) {
      print('Erro ao listar cursos com notas: $e');
      return [];
    }
  }
}
