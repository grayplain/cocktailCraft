// ボタンが1つ存在する画面を表示する
// ボタンを押すと、1つ前の画面に戻る

import 'package:booy/Entity/CockTail.dart';
import 'package:flutter/material.dart';
import 'package:booy/ViewParts/CockTailListCard.dart';

import 'CockTailDetail.dart';

class CockTailList extends StatelessWidget {
  //CockTail のリストを受け取る
  Future<List<CockTail>> cockTailList = CockTail.fetchCockTail();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('一覧画面'),
      ),
    //戻るボタン
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //FruitsList の addFruitsFromApi で取得した Fruits のリストを ListView で表示する
          //FutureBuilder を利用する
          //ListView の中身は、Fruits の名前を表示する
          Container(
            child: FutureBuilder(
              future: cockTailList,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  } return Expanded(
                    // height: 400,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(6),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: CockTailListCard(
                              cockTail: snapshot.data[index],
                            ),
                            onTap: () {
                              // CockTailDetail に遷移する
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CockTailDetail(
                                    cockTail: snapshot.data[index], key: Key("cockTailDetail"),
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
          ),

          //戻る!ボタンをBottom に配置する
          Center(
            child: ElevatedButton(
              child: Text('戻る!'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),


    );
  }
}