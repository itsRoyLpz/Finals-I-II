//AQUÍ SE CREA LA BASE DE DATOS
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping/screens/models/cart_model_food.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import '../screens/models/cart_model.dart';


class DatabaseHelperCat {
  DatabaseHelperCat._privateConstructor();
  static final DatabaseHelperCat inst = DatabaseHelperCat._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'foodcart.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
    }
  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE food (
        id INTEGER PRIMARY KEY,
        name TEXT,
        price TEXT,
        brand TEXT,
        image TEXT

      )
      '''
    );
  }

  Future<int> add(Food food) async {
    Database db = await inst.database;
    return await db.insert('food', food.toMap());
  }

  Future<int> delete(int id) async {
    Database db = await inst.database;
    return await db.delete('food', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Food food) async{
    Database db = await inst.database;
    return await db.update('food', food.toMap(), where: 'id = ?', whereArgs: [food.id]);
  }

  Future<List<Food>> getFood() async {
    Database db = await inst.database;
    var food = await db.query('food', orderBy: 'id');

    List<Food>catsList =
      food.isNotEmpty ? food.map((e) => Food.fromMap(e)).toList():[];
      return catsList;
  }

}