import 'Drink.dart';
import 'Mix.dart';
import 'Recipe.dart';

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

  //コンストラクタ
  CockTail(this.name, this.description,this.recipes, this.base, this.mix);


}