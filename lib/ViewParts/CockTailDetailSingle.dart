
import 'package:booy/Entity/AbvRate.dart';
import 'package:booy/Entity/Drink.dart';
import 'package:booy/Entity/Recipe.dart';
import 'package:booy/ViewParts/AVBRateIcons.dart';
import 'package:flutter/material.dart';

import '../Entity/CockTail.dart';
import '../IconData/cocktal_craft__a_v_b_icons.dart';


class CockTailDetailSingle extends StatefulWidget {
  static final String path = "lib/src/pages/hotel/details.dart";
  CockTail cockTail;

// cockTail は CockTailDetail から受け取る
  CockTailDetailSingle({required this.cockTail});

  @override
  _CockTailDetailSingleState createState() => _CockTailDetailSingleState();
}

class _CockTailDetailSingleState extends State<CockTailDetailSingle> {
  late Future<List<Recipe>> _myRecipes;


  @override
  void initState() {
    super.initState();
    _myRecipes = Recipe.getRecipes(widget.cockTail.cocktailID);
    //cocktail.recipes に Recipe を追加する
    //追加する Recipe は、Recipe class にある、getSampleRecipe() を呼び出すことで取得できる

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(color: Colors.black26),
              alignment: Alignment.center,
              height: 400,
              child: Image.asset("images/" + widget.cockTail.cocktailImageName, fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.cockTail.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        widget.cockTail.base.name,
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AVBRateIcons(abvRate: widget.cockTail.abvRate,
                                    enableColor: Color.fromRGBO(128, 0, 128, 1.0),
                                    disableColor: Color.fromRGBO(128, 0, 128, 0.2),
                                    fontSize: 20),
                                Text(
                                  getAbvRateString(widget.cockTail.abvRate),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),

                      const SizedBox(height: 30.0),
                      DetailDescriptionItem(title: "説明", values: [widget.cockTail.description]),
                      const SizedBox(height: 50.0),
                      FutureBuilder(future: _myRecipes,
                      builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
                        if (snapshot.hasData) {
                          return DetailRecipeItem(title: "材料", values: snapshot.data!);
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                      const SizedBox(height: 50.0),
                      DetailSkillItem(title: "作り方", value: widget.cockTail.skill),
                      const SizedBox(height: 10.0),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "詳細",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class DetailDescriptionItem extends StatelessWidget {
final String title;
final List<String> values;

const DetailDescriptionItem({required this.title, required this.values});

@override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 18.0),
    ),
    const SizedBox(height: 5.0),

    // ここで values の要素を全て取り出し、Text Widget を作成する
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: values.map((item) {
            return Text(
              item,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0), // テキストのスタイルを指定
            );
          }).toList(),
        )
  ]);
}

}

class DetailRecipeItem extends StatelessWidget {
  final String title;
  final List<Recipe> values;

  const DetailRecipeItem({required this.title, required this.values});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18.0),
          ),
          const SizedBox(height: 5.0),

          // ここで values の要素を全て取り出し、Text Widget を作成する
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: values.map((item) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.getMaterialName(),
                    style: TextStyle(fontWeight: FontWeight.w300,
                        fontSize: 16.0), // テキストのスタイルを指定
                  ),
                  Text(
                    item.getAmountAndUnit(),
                    style: TextStyle(fontWeight: FontWeight.w300,
                        fontSize: 16.0), // テキストのスタイルを指定
                  ),
                ],
              );
            }).toList(),
          )
        ]);
  }
}


class DetailSkillItem extends StatelessWidget {
  final String title;
  final String value;

  const DetailSkillItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18.0),
          ),
          const SizedBox(height: 5.0),

          // ここで values の要素を全て取り出し、Text Widget を作成する
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(value,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0))],
          )
        ]);
  }
}