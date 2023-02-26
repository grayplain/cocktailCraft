// ボタンが1つ存在する画面を表示する
// ボタンを押すと、1つ前の画面に戻る

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
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
              future: fruitsList.addFruitsFromApi(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } return Container(
                    height: 400,
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: Text(snapshot.data[index].name),
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