import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';

import '../model/User.dart';


class DatabaseConnection{
  Future<Database>setDatabase()async{
    var directory =await getApplicationDocumentsDirectory();
    var path =join(directory.path+'Users');
    var database=await openDatabase(path,version: 1,onCreate: _createDatabase);
    return database;
  }
  Future<void>_createDatabase(Database database,int version)async{
    await database.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,contact text,age TEXT,"
            "notes TEXT)"
    );
  }
}