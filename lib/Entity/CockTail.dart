import 'package:booy/Entity/AbvRate.dart';
import 'package:booy/Entity/Garnish.dart';
import '../Database/DatabaseHelper.dart';

import 'Drink.dart';
import 'Recipe.dart';
import 'AbvRate.dart';

// カクテルを定義する
// name: カクテルの名前
// description: カクテルの説明
// materials: カクテルに入れる材料
//

class CockTail {
  int cocktailID;
  String cocktailImageName;
  String name;
  String description;
  List<Recipe> recipes;
  Drink base;
  String skill;
  AbvRate abvRate;
  //コンストラクタ
  CockTail(this.cocktailID,this.cocktailImageName, this.name, this.description,this.recipes, this.base, this.skill, this.abvRate);

  //ダミーデータを作成
  static CockTail dummyCockTail() {
    return CockTail(
        0,
        'dummyImageName.png',
        'dummyName',
        'dummyDescription',
        [], Drink.dummyDrink(),
        "skill",
        AbvRate.none);
  }

  //サンプルデータ(ジントニック)を作成
  static CockTail sampleCockTail() {
    return CockTail(
        0,
        'dummyImageName.png',
        'ジントニック',
        'ジンとトニックウォーターを混ぜたカクテル',
        [
          Recipe(Drink.sampleHardDrink(), 60, Unit.ml),
          Recipe(Drink.sampleSoftDrink(), 120, Unit.ml),
          Recipe(Garnish.sampleGarish(), 1, Unit.piece)
        ],
        Drink.sampleHardDrink(),
        "skill",
        AbvRate.intermediate);
  }

  // DatabaseHelper の queryAllCocktailRows() の結果から、Cocktail オブジェクトを作成する
  static List<CockTail> createCockTailList(List<Map<String, dynamic>> queryResult) {
    return List<CockTail>.generate(
      queryResult.length,
          (index) {
        var row = queryResult[index];
        return CockTail(
          index,
          row["id"] + ".png",
          row["name"],
          row["description"],
          [],
            Drink(row["base"], row["base_name"], "description", 0), //ベースの説明は利用しないので、設定していない。
            row["mix"],
          getAbvRate(row["abv"])
        );
      },
    );
  }


  // DatabaseHelper の queryAllCocktailRows() の結果から、Cocktail オブジェクトを作成する
  static Future<List<CockTail>> fetchCockTail() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    var queryResult = await helper.queryAllCocktailRows();

    return CockTail.createCockTailList(queryResult);
  }

  //2秒後に Cocktail を返却する
  static Future<List<CockTail>> fetchCockTailBoom() async {
    return Future.delayed(Duration(seconds: 2), () => [dummyCockTail(),dummyCockTail(),dummyCockTail()]);
  }

}