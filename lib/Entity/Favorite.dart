

import '../Database/DatabaseHelper.dart';

class Favorite {
  String favoriteID;
  bool isFavorite;

  //コンストラクタ
  Favorite(this.favoriteID, this.isFavorite);

  // DatabaseHelper の queryAllCocktailRows() の結果から、Favorite オブジェクトを作成する
  static List<Favorite> createFavoriteList(List<Map<String, dynamic>> queryResult) {
    var returnList =  List<Favorite>.generate(
      queryResult.length,
          (index) {
        var row = queryResult[index];
        var favoriteID = row['cocktailID'];
        var isFavorite = row['isFavorite'] == 1 ? true : false;
        return Favorite(
          favoriteID,
          isFavorite
        );
      },
    );

    //もし returnList が1件以上存在すれば、returnList を返す
    // returnList が0件の場合は、空のFavoriteオブジェクトを返す
    if (returnList.isNotEmpty) {
      return returnList;
    } else {
      return [Favorite('0', false)];
    }
  }

  // DatabaseHelper の queryAllFavoriteRows() の結果から、Favorite オブジェクトを作成する
  static Future<List<Favorite>> fetchFavorite() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    var queryResult = await helper.queryAllFavoriteRows();

    return Favorite.createFavoriteList(queryResult);
  }

  // List<Favorite>の中にある Favorite オブジェクトの favoriteID が引数の favoriteID と一致するものを返す
  static Favorite getFavorite(List<Favorite> favoriteList, String favoriteID) {
    for (Favorite favorite in favoriteList) {
      if (favorite.favoriteID == favoriteID) {
        return favorite;
      }
    }
    return Favorite(favoriteID, false);
  }

  // DatabaseHelper の deleteFavoriteRow() を呼び出す
  static Future<int> deleteFavorite(String favoriteID) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    return await helper.deleteFavorite(favoriteID);
  }

  // DatabaseHelper の insertFavoriteRow() を呼び出す
  static Future<int> insertFavorite(String favoriteID) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    return await helper.insertFavorite(favoriteID);
  }
}