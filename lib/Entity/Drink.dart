

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
}