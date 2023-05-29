import 'package:notepad/databaseconnection/Connection.dart';
import 'package:sqflite/sqflite.dart';

class repositary{
  late DatabaseConnection _databaseConnection;
  repositary(){
    _databaseConnection=DatabaseConnection();
  }
  static Database? _database;
  Future<Database?> get database async{
    if(_database !=null){
      return _database;
    }else{
      _database=await _databaseConnection.setDatabase();
      return _database;
    }
  }
  //insert datas
  insert(table,data)async{
    var connection=await database;
    return await connection?.insert(table, data);
  }
  // read all record
  readData(table) async{
    var connection=await database;
    return await connection?.query(table);
  }
  //read single record
  readDatausingId(table,userId) async{
    var connection=await database;
    return await connection?.query(table,where: 'id=?',whereArgs: [userId]);
  }
  //update
  updateData(table,data)async{
    var connection=await database;
    return await connection?.update(table, data,where: 'id=?',whereArgs: [data['id']]);
  }
  //delete
  deleteData(table,userid)async{
    var connection=await database;
    return await connection?.rawDelete("delete from $table where id=$userid");
  }

}