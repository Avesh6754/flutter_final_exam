
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../modal/modal_class.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();

  Database? _database;

  final _table="habit";

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initState();
    return _database;
  }

  Future<Database> initState() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $_table (id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT, progress REAL, remindertime INTEGER,targetDays INTEGER,habitName TEXT)');
    });

  }
  Future<void> insertData(ModalClass items)
  async {
    final db=await database;
    await db!.insert(_table,ModalClass.toMap(items),conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<void> updateData(ModalClass items)
  async {
    final db=await database;
    await db!.update(_table,ModalClass.toMap(items),where: 'id=?',whereArgs: [items.id!]);
  }
  Future<void> deleteData(int id)
  async {
    final db=await database;
   await  db!.delete(_table,where: 'id=?',whereArgs: [id]);
  }
  Future<List<Map<String, Object?>>> fetchAll()
  async {
    final db=await database;
   return await db!.query(_table);
  }

  Future<void> updateProgress(ModalClass items)
  async {
    final db=await database;
    await db!.update(_table,ModalClass.toMap(items),where: 'id=?',whereArgs: [items.id!]);
  }

}
