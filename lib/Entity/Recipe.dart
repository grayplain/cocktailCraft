// カクテルに入れる材料を定義
import 'Drink.dart';

abstract class Material {
  String getID();
  String getName();
  String getDescription();
}

class Recipe {
  Material material;
  double amount;
  String unit;

  //コンストラクタ
  Recipe(this.material, this.amount, this.unit);

  //材料の名前を取得
  String getMaterialName() {
    return material.getName();
  }

  //材料の名前及び分量を取得
  String getAmountAndUnit() {
    return amount.toString() + unit;
  }

  static Future<List<Recipe>> getSampleRecipe() async{
    List<Recipe> recipes = [];
    recipes.add(Recipe(Drink.sampleHardDrink(), 50, "ml"));
    recipes.add(Recipe(Drink.sampleSoftDrink(), 100, "ml"));
    return recipes;
  }
}