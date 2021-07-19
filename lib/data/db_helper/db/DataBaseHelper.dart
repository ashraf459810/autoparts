import 'package:autopart/data/db_helper/entite/Product.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String carttable = 'cart_table';
  String colId = 'id';
  String colname = 'name';
  String colstatus = 'status';
  String colcount = 'count';
  String colprice = 'price';
  String colimage = 'image';
  String colbackendid = 'backendid';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'cart.db';

    // Open/create the database at a given path
    var cartDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return cartDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $carttable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colname TEXT, '
        '$colstatus TEXT, $colprice REAL, $colcount INTEGER,$colimage TEXT,$colbackendid INTEGER)');
  }

  // Fetch Operation: Get all product objects from database
  Future<List<Map<String, dynamic>>> getProductsMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $cartTable order by $colPriority ASC');
    var result = await db.query(carttable, orderBy: '$colname ASC');
    return result;
  }

  // Insert Operation: Insert a product object to database
  Future<int> insertproduct(Product product) async {
    Database db = await this.database;
    var isreapeated = await db.rawQuery(
        'SELECT * FROM $carttable where backendid = ${product.backendid}');

    if (isreapeated.isEmpty) {
      print("new from insert");
      var result = await db.insert(carttable, product.toMap());
      return result;
    } else {
      print("repeated from insert");
      // Product pproduct = Product(product.count++, product.image, product.name,
      //     product.price, product.status, product.backendid);
      // product.count = product.count++;
      print("here the product count${product.count}");
      var result = await db.update(carttable, product.toMap(),
          where: '$colbackendid = ?', whereArgs: [product.backendid]);

      return result;
    }
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateproduct(Product product) async {
    var db = await this.database;
    var result = await db.update(carttable, product.toMap(),
        where: '$colbackendid = ?', whereArgs: [product.backendid]);
    return result;
  }

  // Delete Operation: Delete a product object from database
  Future<int> deleteproduct(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $carttable WHERE $colId = $id');
    return result;
  }

  // Get number of product objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $carttable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'product List' [ List<product> ]
  Future<List<Product>> getproductsList() async {
    var productMapList =
        await getProductsMapList(); // Get 'Map List' from database
    int count =
        productMapList.length; // Count the number of map entries in db table

    List<Product> productList = [];
    // For loop to create a 'product List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      productList.add(Product.fromMapObject(productMapList[i]));
    }

    return productList;
  }
}
