import 'package:booy/Entity/AlbRate.dart';
import 'package:booy/Entity/Garnish.dart';

import 'Drink.dart';
import 'Mix.dart';
import 'Recipe.dart';
import 'AlbRate.dart';

// カクテルを定義する
// name: カクテルの名前
// description: カクテルの説明
// materials: カクテルに入れる材料
//

class CockTail {
  String name;
  String description;
  List<Recipe> recipes;
  Drink base;
  Mix mix;
  AlbRate albRate;

  //コンストラクタ
  CockTail(this.name, this.description,this.recipes, this.base, this.mix, this.albRate);

  //ダミーデータを作成
  static CockTail dummyCockTail() {
    return CockTail('dummyName',
        'dummyDescription',
        [], Drink.dummyDrink(),
        Mix.dummyMix,
        AlbRate.none);
  }

  //サンプルデータ(ジントニック)を作成
  static CockTail sampleCockTail() {
    return CockTail('ジントニック',
        'ジンとトニックウォーターを混ぜたカクテル',
        [
          Recipe(Drink.sampleHardDrink(), 60, Unit.ml),
          Recipe(Drink.sampleSoftDrink(), 120, Unit.ml),
          Recipe(Garnish.sampleGarish(), 1, Unit.piece)
        ],
        Drink.sampleHardDrink(),
        Mix(MixType.stir),
        AlbRate.intermediate);
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