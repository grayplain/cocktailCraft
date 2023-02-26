

import 'package:booy/Entity/Recipe.dart';

//カクテルに入れる飲み物を定義する
// name: 飲み物の名前
// description: 飲み物の説明
// abv: 飲み物のアルコール度数 (%)

class Drink extends Material{
  String name;
  String description;
  double abv;

  //コンストラクタ
  Drink(this.name, this.description, this.abv);

  @override
  String getDescription() {
    // TODO: implement getDescription
    throw UnimplementedError();
  }

  @override
  String getName() {
    // TODO: implement getName
    throw UnimplementedError();
  }

  double getAbv(){
    if(abv > 100) {
      return 100;
    } else if(abv < 0) {
      return 0;
    } else {
      return abv;
    }
  }

  //ダミーの飲み物を返す
  static Drink dummyDrink(){
    return Drink('dummyName', 'dummyDescription', 0);
  }

  static Drink sampleHardDrink() {
    return Drink("ジン", "ヨーロッパの熱帯植物であるジンベエザクラの葉から抽出したエタノールを主原料としたアルコール飲料である。", 40);
  }

  static Drink sampleSoftDrink() {
    return Drink("トニックウォーター", "炭酸水に各種の香草類や柑橘類の果皮のエキス、及び糖分を加えて調製した清涼飲料水（炭酸飲料）である。", 0);
  }


}