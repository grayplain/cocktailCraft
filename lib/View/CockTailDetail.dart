import 'package:booy/Entity/CockTail.dart';
import 'package:booy/ViewParts/CockTailDetailSingle.dart';
import 'package:flutter/material.dart';

// カクテルの詳細を表示する StatelessWidget。
// リストの中身をクリックすると、そのカクテルの詳細が表示される。
// この画面から、カクテルの作り方を見ることができる。
class CockTailDetail extends StatelessWidget {
  //CockTail のリストを受け取る
  final CockTail cockTail;

  //コンストラクタ
  CockTailDetail({required Key key, required this.cockTail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('詳細画面'),
      // ),
      //戻るボタン
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: CockTailDetailSingle(cockTail: cockTail)),

        ],
      ),
    );
  }
}
// CockTail クラスのインスタンスを CockTailList から受け取り、それを表示する
// 画面遷移は、CockTailList から行う

