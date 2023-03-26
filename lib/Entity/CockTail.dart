import 'package:booy/Entity/AbvRate.dart';
import 'package:booy/Entity/Garnish.dart';

import 'Drink.dart';
import 'Mix.dart';
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
  Mix mix;
  AbvRate abvRate;
  //コンストラクタ
  CockTail(this.cocktailID,this.cocktailImageName, this.name, this.description,this.recipes, this.base, this.mix, this.abvRate);

  //ダミーデータを作成
  static CockTail dummyCockTail() {
    return CockTail(
        0,
        'dummyImageName.png',
        'dummyName',
        'dummyDescription',
        [], Drink.dummyDrink(),
        Mix.dummyMix,
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
        Mix(MixType.stir),
        AbvRate.intermediate);
  }

  //2秒後に Cocktail を返却する
  static Future<List<CockTail>> fetchCockTail() async {
    return Future.delayed(Duration(seconds: 0), () => [sampleCockTail(),sampleCockTail(),sampleCockTail(),sampleCockTail(),sampleCockTail()]);
  }

  //2秒後に Cocktail を返却する
  static Future<List<CockTail>> fetchCockTailBoom() async {
    return Future.delayed(Duration(seconds: 2), () => [dummyCockTail(),dummyCockTail(),dummyCockTail()]);
  }

}