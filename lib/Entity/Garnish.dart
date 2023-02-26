// カクテルの飾りを定義する
// 例: オレンジスライス、シナモンスティック、レモンスライス、など
// name: 飾りの名前
// description: 飾りの説明


import 'Recipe.dart';

class Garnish extends Material {
  String name;
  String description;

  //コンストラクタ
  Garnish(this.name, this.description);

  @override
  String getDescription() {
    return description;
  }

  @override
  String getName() {
    return name;
  }

  Garnish dummyGarnish(){
    return Garnish('dummyName', 'dummyDescription');
  }

  static Garnish sampleGarish(){
    return Garnish('ライム', 'ライムの皮を薄くスライスしたもの');
  }
}
