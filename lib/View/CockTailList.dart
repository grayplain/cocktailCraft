// ボタンが1つ存在する画面を表示する
// ボタンを押すと、1つ前の画面に戻る

import 'package:booy/Entity/CockTail.dart';
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

    @override
    void initState() {
      super.initState();
      cockTailList = CockTail.fetchCockTail();
    }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('一覧画面'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FutureBuilder(
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
                                  cockTail: snapshot.data[index], key: const Key("cockTailDetail"),
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

          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                cockTailList = CockTail.fetchCockTailBoom();
                setState(() {});
              },
              child: const Text('更新'),
            ),
          ),

          //戻る!ボタンをBottom に配置する
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('戻る!'),
            ),
          ),
        ],
      ),
    );
  }
}