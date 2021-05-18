import 'dart:core';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


import 'package:sqflite/sqlite_api.dart';


import 'model/CartModel.dart';


class SQL_Helper {

  static SQL_Helper dbHelper;
  static Database _database;

  SQL_Helper._createInstance();

  factory SQL_Helper() {
    if (dbHelper == null) {
      dbHelper = SQL_Helper._createInstance();
    }
    return dbHelper;
  }

  String tableName = "students_table";
  String _id = "id";
  String _orderId = "orderId";
  String _qty = "qty";
  String _price = "price";
  String _pricewithcurrency = "priceWithCurrency";
  String _total = "total";
  String _productId = "productId";
  String __imageProduct = "imageProduct";
  String __nameProduct = "nameProduct";
  String __sizeeProduct = "sizeProduct";
  String __comment = "comment";

  Future<Database> get database async {
      if (_database == null){
          _database = await initializedDatabase();
      }
      return _database;
  }


  Future<Database> initializedDatabase() async {

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "students.db";

     var studentDB = await openDatabase(path, version: 5, onCreate: createDatabase);
     return studentDB;
  }


  void createDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($_id INTEGER PRIMARY KEY AUTOINCREMENT, $_orderId TEXT, $_qty TEXT," +
            " $_price TEXT,$_pricewithcurrency TEXT,  $_total TEXT,TEXT,$_productId TEXT,"
                "$__imageProduct TEXT,$__nameProduct TEXT,"
                "$__sizeeProduct INTEGER,$__comment TEXT   )");
  }

   Future<List<Map<String, dynamic>>> getStudentMapList() async {
       Database db = await this.database;

       //var result1 =  await db.rawQuery("SELECT * FROM $tableName ORDER BY $_id ASC");
       var result = await db.query(tableName, orderBy: "$_id ASC");
       return result;
  }

  Future<int> insertStudent(CartModel student) async {
    Database db = await this.database;
    var result = await db.insert(tableName, student.toMap());
    return result;
  }

  Future<int> updateStudent(CartModel student) async{
    Database db = await this.database;
    var result = await db.update(tableName, student.toMap(), where: "$_id = ?", whereArgs: [student.id]);
    return result;
  }


  Future<int> deleteStudent(int id) async {
    var db = await this.database;
    int result = await db.rawDelete("DELETE FROM $tableName WHERE $_id = $id");
    return result;
  }


  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> all = await db.rawQuery("SELECT COUNT (*) FROM $tableName");
    int result = Sqflite.firstIntValue(all);
    return result;
  }
  
  Future<List<CartModel>> getStudentList() async{
    
    var studentMapList = await getStudentMapList();
    int count = studentMapList.length;
    
    // ignore: deprecated_member_use
    List<CartModel> students = new List<CartModel>();
    
    for (int i = 0; i <= count -1; i++){
      students.add(CartModel.getMap(studentMapList[i]));
    }

    return students;
  }
}