import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String tableWishlist = "wishlist";
final String columnId = "_id";
final String columnProductID = "product_id";
final String columnProductName = "product_name";
final String columnProductPrice = "product_price";
final String columnQuantity = "product_quantity";
final String columnProductImage = "Product_image";
final String columnProductRate = "product_rate";
final String columnProductDes = "product_des";

class WishlistDatabase {
  int id;
  String uid, name, price, from, to, rate, flagDate, des, quantity, image;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnProductID: uid,
      columnProductName: name,
      columnProductPrice: price,
      columnQuantity: quantity,
      columnProductImage: image,
      columnProductRate: rate,
      columnProductDes: des,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  WishlistDatabase();

  WishlistDatabase.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    uid = map[columnProductID];
    name = map[columnProductName];
    price = map[columnProductPrice];
    rate = map[columnProductRate];
    quantity = map[columnQuantity];
    image = map[columnProductImage];
    des = map[columnProductDes];
  }
}

class DatabaseSqlLite {
  static final DatabaseSqlLite _instance =
      new DatabaseSqlLite.internal();

  factory DatabaseSqlLite() => _instance;

  static Database _db;

  DatabaseSqlLite.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'buyer.db');

    await deleteDatabase(path); // just for testing

    var db = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableWishlist($columnId INTEGER PRIMARY KEY, $columnProductID TEXT, $columnProductImage TEXT, $columnProductName TEXT,$columnQuantity TEXT,$columnProductRate TEXT,$columnProductDes TEXT, $columnProductPrice TEXT)');
  }

  void _onUpgrade(Database db, int newVersion, int old) async {
    await db.execute("DROP TABLE $tableWishlist IF EXIST");
    await db.execute(
        'CREATE TABLE $tableWishlist($columnId INTEGER PRIMARY KEY, $columnProductID TEXT,$columnQuantity TEXT,$columnProductImage TEXT, $columnProductName TEXT, $columnProductRate TEXT,$columnProductDes TEXT, $columnProductPrice TEXT)');
  }

  Future<int> insertProduct(WishlistDatabase product) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableWishlist, product.toMap());
//    var result = await dbClient.rawInsert(
//        'INSERT INTO $tableNote ($columnTitle, $columnDescription) VALUES (\'${note.title}\', \'${note.description}\')');

    return result;
  }

  Future<List<WishlistDatabase>> getAllCartProduct() async {
    // ignore: deprecated_member_use
    List<WishlistDatabase> products = new List<WishlistDatabase>();
    var dbClient = await db;
    var result = await dbClient.query(tableWishlist, columns: [
      columnId,
      columnProductID,
      columnProductName,
      columnProductPrice,
      columnQuantity,
      columnProductImage,
      columnProductRate,
      // columnProductFlagDate,
      columnProductDes
    ]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote');

    WishlistDatabase product;
    for (int i = 0; i < result.length; i++) {
      product = new WishlistDatabase.fromMap(result[i]);
      products.add(product);
    }
    return products;
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableWishlist'));
  }

  Future<WishlistDatabase> getProduct(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableWishlist,
        columns: [
          columnId,
          columnProductID,
          columnProductName,
          columnProductPrice,
          columnProductImage,
          //columnProductFlagDate,
          columnProductRate,
          columnQuantity,
          columnProductDes,
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote WHERE $columnId = $id');

    if (result.length > 0) {
      return new WishlistDatabase.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteProduct(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableWishlist, where: '$columnProductID = ?', whereArgs: [id]);
//    return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
  }

  Future<int> deleteAllProducts() async {
    var dbClient = await db;
    return await dbClient.delete(tableWishlist, where: '1', whereArgs: []);
//    return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
  }

  Future<int> updateProduct(WishlistDatabase product) async {
    var dbClient = await db;
    return await dbClient.update(tableWishlist, product.toMap(),
        where: "$columnId = ?", whereArgs: [product.id]);
//    return await dbClient.rawUpdate(
//        'UPDATE $tableNote SET $columnTitle = \'${note.title}\', $columnDescription = \'${note.description}\' WHERE $columnId = ${note.id}');
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
