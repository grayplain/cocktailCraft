// ボタンが1つ存在する画面を表示する
// ボタンを押すと、1つ前の画面に戻る

import 'package:booy/Entity/CockTail.dart';
import 'package:booy/Entity/Favorite.dart';
import 'package:flutter/material.dart';
import 'package:booy/ViewParts/CockTailListCard.dart';
import 'CockTailDetail.dart';

class CockTailList extends StatefulWidget {
  @override
  _CockTailListState createState() => _CockTailListState();
}

  class _CockTailListState extends State<CockTailList> {
    //CockTail のリストを受け取る
    Future<List<CockTail>> cockTailList = CockTail.fetchCockTail();
    Future<List<Favorite>> favoriteList = Favorite.fetchFavorite();

    @override
    void initState() {
      super.initState();
      cockTailList = CockTail.fetchCockTail();
    }

    //お気に入りボタンを押した時の処理
    //引数に cocktailID を渡すことで、お気に入りボタンを押したカードのお気に入り状態を変更する
  void favoriteCallback(String cocktailID) {
    setState(() {
      //favoriteList を更新する
      Favorite.deleteFavorite(cocktailID);
      Favorite.insertFavorite(cocktailID);
      // super.setState(() {
      //   favoriteList = Favorite.fetchFavorite();
      // });
    });
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
            future: Future.wait([cockTailList,favoriteList]),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.connectionState == ConnectionState.done) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                final List<dynamic> data = snapshot.data!;
                final cockTailList = data[0] as List<CockTail>;
                final favoriteList = data[1] as List<Favorite>;

                return Expanded(
                  // height: 400,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(6),
                      itemCount: cockTailList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: CockTailListCard(
                            cockTail: cockTailList[index],
                            isFavorite: Favorite.getFavorite(favoriteList, cockTailList[index].cocktailID),
                            favoriteCallback: favoriteCallback,
                          ),
                          onTap: () {
                            // CockTailDetail に遷移する
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CockTailDetail(
                                  cockTail: cockTailList[index], key: const Key("cockTailDetail"),
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