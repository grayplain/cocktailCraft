// ボタンが1つ存在する画面を表示する
// ボタンを押すと、1つ前の画面に戻る

import 'package:booy/Entity/CockTail.dart';
import 'package:booy/Entity/Favorite.dart';
import 'package:flutter/material.dart';
import 'package:booy/ViewParts/CockTailListCard.dart';
import 'CockTailDetail.dart';

//CockTailListを呼び出すときに、isFavorite を引数として指定できるようにする
class CockTailList extends StatefulWidget {
  //初期画面表示時、cocktailList の取得方法を変更するフラグ
  bool isFavorite = false;
  //コンストラクタ
  CockTailList({Key? key, required this.isFavorite}) : super(key: key);

  @override
  _CockTailListState createState() => _CockTailListState();
}

class _CockTailListState extends State<CockTailList> {
  //CockTail のリストを受け取る
  // Future<List<CockTail>> cockTailList = CockTail.fetchCockTail();
  // Future<List<Favorite>> favoriteList = Favorite.fetchFavorite();
  late Future<List<CockTail>> cockTailList;
  late Future<List<Favorite>> favoriteList;

  @override
  void initState() {
    super.initState();

    if (widget.isFavorite) {
      cockTailList = CockTail.fetchFavoriteCockTail();
      favoriteList = Favorite.fetchFavorite();
    } else {
      cockTailList = CockTail.fetchCockTail();
      favoriteList = Favorite.fetchFavorite();
    }
  }

  //お気に入りボタンを押した時の処理
  //引数に cocktailID を渡すことで、お気に入りボタンを押したカードのお気に入り状態を変更する
  void favoriteCallback(String cocktailID, bool isFavorite) async {
    Favorite.updateFavorite(cocktailID, isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('一覧画面'),
      //   backgroundColor: Colors.red
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 20),
          FutureBuilder(
            future: Future.wait([cockTailList, favoriteList]),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                final List<dynamic> data = snapshot.data!;
                final cockTailList = data[0] as List<CockTail>;
                final favoriteList = data[1] as List<Favorite>;

                if (cockTailList.length == 0) {
                  //画面上部の中央に Text を表示する
                  return Container(
                    alignment: Alignment.center,
                    height: 500,
                    child: Text(
                      "お気に入りがありません",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }

                return Expanded(
                  // height: 400,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(6),
                      itemCount: cockTailList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: CockTailListCard(
                            cockTail: cockTailList[index],
                            isFavorite: Favorite.getFavorite(
                                favoriteList, cockTailList[index].cocktailID),
                            favoriteCallback: favoriteCallback,
                          ),
                          onTap: () {
                            // CockTailDetail に遷移する
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CockTailDetail(
                                  cockTail: cockTailList[index],
                                  key: const Key("cockTailDetail"),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                );
              } else {
                // return Text("ロード中...");
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
