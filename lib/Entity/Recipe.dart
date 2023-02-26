// カクテルに入れる材料を定義
abstract class Material {
  String getName();
  String getDescription();
}

// カクテルのレシピに入れる材料の単位を定義
enum Unit {
  ml,
  g,
  piece
}

class Recipe {
  Material material;
  double amount;
  Unit unit;

  //コンストラクタ
  Recipe(this.material, this.amount, this.unit);

  //材料の名前を取得
  String getMaterialName() {
    return material.getName();
  }
}