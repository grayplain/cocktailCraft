import 'dart:io';

import 'package:booy/Entity/Favorite.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db"; // DB名
  static final _databaseVersion = 1; // スキーマのバージョン指定

  static final drinkTable = 'Drink';
  static final cocktail_jp_Table = 'cocktail_jp';
  static final material_jp_Table = 'material_jp';
  static final favorite_Table = 'Favorite';

  // static final columnId = '_id';
  // static final columnName = 'name';
  // static final columnDescription = 'description';
  // static final columnAbv = 'abv';

  // DatabaseHelper クラスを定義
  DatabaseHelper._privateConstructor();

  // DatabaseHelper._privateConstructor() コンストラクタを使用して生成されたインスタンスを返すように定義
  // DatabaseHelper クラスのインスタンスは、常に同じものであるという保証
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Databaseクラス型のstatic変数_databaseを宣言
  // クラスはインスタンス化しない
  static Database? _database;

  // databaseメソッド定義
  // 非同期処理
  Future<Database?> get database async {
    // _databaseがNULLか判定
    // NULLの場合、_initDatabaseを呼び出しデータベースの初期化し、_databaseに返す
    // NULLでない場合、そのまま_database変数を返す
    // これにより、データベースを初期化する処理は、最初にデータベースを参照するときにのみ実行されるようになります。
    // このような実装を「遅延初期化 (lazy initialization)」と呼びます。
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // データベース接続
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + '/cocktailDB.db';

    // Check if the database file already exists
    if (!await File(path).exists()) {
      // If not, copy the pre-populated database file from the assets
      ByteData data = await rootBundle.load('assets/CockTailMaster.db');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save the pre-populated database file to the application documents directory
      await File(path).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(path, version: _databaseVersion);
  }

  //DBからカクテル情報を全て取得する
  Future<List<Map<String, dynamic>>> queryAllCocktailRows() async {
    Database? db = await instance.database;
    final String sql = '''
    SELECT c.*, b.name AS base_name
    FROM Cocktail_jp AS c
    JOIN material_jp AS b ON c.base = b.id;
    ''';
    return await db!.rawQuery(sql);
  }

  //DBからカクテル情報を全て取得する
  Future<List<Map<String, dynamic>>> queryAllMaterialRows() async {
    Database? db = await instance.database;
    return await db!.query(material_jp_Table);
  }

  //DBからお気に入り情報を全て取得する
  Future<List<Map<String, dynamic>>> queryAllFavoriteRows() async {
    Database? db = await instance.database;
    return await db!.query(favorite_Table);
  }

  //DBからお気に入りのカクテル情報を取得する
  Future<List<Map<String, dynamic>>> queryFavoriteCocktailRows() async {
    Database? db = await instance.database;
    final String sql = '''
    SELECT c.*, b.name AS base_name
    FROM Cocktail_jp AS c
    JOIN material_jp AS b ON c.base = b.id and c.id in (select cocktailID from Favorite where isFavorite = 1);
    ''';
    return await db!.rawQuery(sql);
  }

  Future<void> insertOrUpdateFavorite(
      String cocktailID, bool isFavorite) async {
    Database? db = await instance.database;
    Map<String, dynamic> favoriteData = {
      'cocktailID': cocktailID,
      'isFavorite': isFavorite ? 1 : 0,
    };

    db!.insert(favorite_Table, favoriteData,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
