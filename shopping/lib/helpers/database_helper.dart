import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import '../screens/models/cart_model.dart';


class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper inst = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'shopcart.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
    }
  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE carts (
        id INTEGER PRIMARY KEY,
        name TEXT,
        price TEXT,
        calories TEXT,
        vitamins TEXT,
        additives TEXT,
        image TEXT

      )
      '''
    );
  }

  Future<int> add(Cart cart) async {
    Database db = await inst.database;
    return await db.insert('carts', cart.toMap());
  }

  Future<int> delete(int id) async {
    Database db = await inst.database;
    return await db.delete('carts', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Cart cart) async{
    Database db = await inst.database;
    return await db.update('carts', cart.toMap(), where: 'id = ?', whereArgs: [cart.id]);
  }

  Future<List<Cart>> getCarts() async {
    Database db = await inst.database;
    var carts = await db.query('carts', orderBy: 'id');

    List<Cart>catsList =
      carts.isNotEmpty ? carts.map((e) => Cart.fromMap(e)).toList():[];
      return catsList;
  }

}