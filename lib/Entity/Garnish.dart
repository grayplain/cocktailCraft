// カクテルの飾りを定義する
// 例: オレンジスライス、シナモンスティック、レモンスライス、など
// name: 飾りの名前
// description: 飾りの説明


import 'Recipe.dart';

class Garnish extends Material {
  int garnishId;
  String name;
  String description;

  //コンストラクタ
  Garnish(this.garnishId, this.name, this.description);

  @override
  int getID() {
    return garnishId;
  }

  @override
  String getDescription() {
    return description;
  }

  @override
  String getName() {
    return name;
  }

  Garnish dummyGarnish(){
    return Garnish(0, 'dummyName', 'dummyDescription');
  }

  static Garnish sampleGarish(){
    return Garnish(1, 'ライム', 'ライムの皮を薄くスライスしたもの');
  }
}
