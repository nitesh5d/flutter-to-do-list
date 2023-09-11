import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper{

  Database? db;
  final tableName = 'tasks';

  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  Future<Database> get getDatabase async =>  db != null? db! : await initializeDb();

  Future<void> createDb(Database database, int version) async {
      await database.execute(
          """
          CREATE TABLE $tableName(
          'id' INTEGER PRIMARY KEY,
          'title' TEXT NOT NULL,
          'desc' TEXT,
          'priority' INTEGER, 
          'createDate' INTEGER NOT NULL DEFAULT (cast(strftime('%s','now') as int)),
          'updateDate' INTEGER NOT NULL DEFAULT (cast(strftime('%s','now') as int))
          )
          """
      );
  }

  Future<Database> initializeDb() async {
    return await openDatabase(
        join(await getDatabasesPath(),"notekeeperMain.bd"),
        version: 1,
        onCreate: createDb,
        singleInstance: true
    );
  }

  Future<int> insert(Map<String, dynamic> row) async{
    Database db = await instance.getDatabase;
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.getDatabase;
    return await db.query(tableName);
  }
}