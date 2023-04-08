// カクテルに入れる材料を定義
import 'package:booy/Database/DatabaseHelper.dart';

import 'Drink.dart';

abstract class Material {
  String getID();
  String getName();
  String getDescription();
}

class Recipe {
  Material material;
  String amount;
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
    recipes.add(Recipe(Drink.sampleHardDrink(), "50", "ml"));
    recipes.add(Recipe(Drink.sampleSoftDrink(), "100", "ml"));
    return recipes;
  }

  static Future<List<Recipe>> getRecipes(String cocktailID) async{
    List<Recipe> recipes = [];
    DatabaseHelper helper = DatabaseHelper.instance;
    var queryResult = await helper.queryRecipeRows(cocktailID);

    for(var row in queryResult){
      var material = row['material'];
      var amount = row['amount'];
      var unit = row['unit'];
      var drink = Drink("0", row['material'],"",0);

      recipes.add(Recipe(Drink("0", row['material'],"",0), row['amount'], row['unit']));
    }
    return recipes;
  }
}