import 'dart:core';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


import 'package:sqflite/sqlite_api.dart';


import 'model/CartModel.dart';
import 'model/FavoraiteModel.dart';


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

  String tableNamefave = "fav_table";
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
  String __desc= "descProduct";
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializedDatabase();
    }
    return _database;
  }


  Future<Database> initializedDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "favoraite.db";

    var studentDB = await openDatabase(
        path, version:7, onCreate: createDatabase);
    return studentDB;
  }


  void createDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($_id INTEGER PRIMARY KEY AUTOINCREMENT, $_orderId TEXT, $_qty TEXT," +
            " $_price TEXT,$_pricewithcurrency TEXT,  $_total TEXT,TEXT,$_productId TEXT,"
                "$__imageProduct TEXT,$__nameProduct TEXT,"
                "$__sizeeProduct INTEGER,$__comment TEXT   )");

    await db.execute(
        "CREATE TABLE $tableNamefave($_id INTEGER PRIMARY KEY AUTOINCREMENT," +
            " $_price TEXT,$_pricewithcurrency TEXT,$_productId TEXT,"
                "$__imageProduct TEXT,$__nameProduct TEXT,$__desc TEXT)");
  }

  Future<List<Map<String, dynamic>>> getStudentMapList() async {
    Database db = await this.database;

    //var result1 =  await db.rawQuery("SELECT * FROM $tableName ORDER BY $_id ASC");
    var result = await db.query(tableName, orderBy: "$_id ASC");
    return result;
  }

  Future<List<Map<String, dynamic>>> getStudentMapListfav() async {
    Database db = await this.database;

    //var result1 =  await db.rawQuery("SELECT * FROM $tableName ORDER BY $_id ASC");
    var result = await db.query(tableNamefave, orderBy: "$_id ASC");
    return result;
  }

  Future<int> insertStudent(CartModel student) async {
    Database db = await this.database;
    var result = await db.insert(tableName, student.toMap());
    return result;
  }

  Future<int> updateStudent(CartModel student) async {
    Database db = await this.database;
    var result = await db.update(
        tableName, student.toMap(), where: "$_id = ?", whereArgs: [student.id]);
    return result;
  }


  Future<int> deleteStudent(int id) async {
    var db = await this.database;
    int result = await db.rawDelete("DELETE FROM $tableName WHERE $_id = $id");
    return result;
  }


  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> all = await db.rawQuery(
        "SELECT COUNT (*) FROM $tableName");
    int result = Sqflite.firstIntValue(all);
    return result;
  }

  Future<List<CartModel>> getStudentList() async {
    var studentMapList = await getStudentMapList();
    int count = studentMapList.length;

    // ignore: deprecated_member_use
    List<CartModel> students = new List<CartModel>();

    for (int i = 0; i <= count - 1; i++) {
      students.add(CartModel.getMap(studentMapList[i]));
    }

    return students;
  }


  Future<int> insertStudentfav(FavoraiteModel student) async {
    Database db = await this.database;
    var result = await db.insert(tableNamefave, student.toMap());
    return result;
  }

  Future<int> updateStudentfav(FavoraiteModel student) async {
    Database db = await this.database;
    var result = await db.update(
        tableNamefave, student.toMap(), where: "$_id = ?", whereArgs: [student.id]);
    return result;
  }


  Future<int> deleteStudentfav(String id) async {
    var db = await this.database;
    int result = await db.rawDelete("DELETE FROM $tableNamefave WHERE $_productId = $id");
    return result;
  }


  Future<int> getCountfav() async {
    Database db = await this.database;
    List<Map<String, dynamic>> all = await db.rawQuery(
        "SELECT COUNT (*) FROM $tableNamefave");
    int result = Sqflite.firstIntValue(all);
    return result;
  }

  Future<List<FavoraiteModel>> getStudentListfav() async {
    var studentMapList = await getStudentMapListfav();
    int count = studentMapList.length;

    // ignore: deprecated_member_use
    List<FavoraiteModel> students = new List<FavoraiteModel>();

    for (int i = 0; i <= count - 1; i++) {
      students.add(FavoraiteModel.getMap(studentMapList[i]));
    }

    return students;
  }

//Raw query to check if it is in the favourites
  Future<int> queryForFav(String checkId) async {
    Database db = await this.database;
    int noOfRows = 0;
    try {
      noOfRows = Sqflite.firstIntValue(await db.rawQuery(
          'SELECT COUNT(*) FROM $tableNamefave WHERE $_productId = ?',
          ['$checkId']));
      print(_productId+checkId);
    } catch (e) {
      print(e);
    }
    return noOfRows;
  }
  Future<void> DropTableFave() async {

    //here we get the Database object by calling the openDatabase method
    //which receives the path and onCreate function and all the good stuff
    Database db =await this.database;

    //here we execute a query to drop the table if exists which is called "tableName"
    //and could be given as method's input parameter too
    db.delete(tableNamefave);

    //and finally here we recreate our beloved "tableName" again which needs
    //some columns initialization

  }

  Future<void> DropTable() async {

    //here we get the Database object by calling the openDatabase method
    //which receives the path and onCreate function and all the good stuff
    Database db =await this.database;

    //here we execute a query to drop the table if exists which is called "tableName"
    //and could be given as method's input parameter too
    db.delete(tableName);


    //and finally here we recreate our beloved "tableName" again which needs
    //some columns initialization

  }
}















