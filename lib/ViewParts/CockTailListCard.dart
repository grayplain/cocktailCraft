import 'dart:math';

import 'package:booy/Entity/CockTail.dart';
import 'package:flutter/material.dart';
import 'package:booy/Entity/CockTail.dart';

//カクテルのリストに表示する Card の Widget
//表示する項目は下記の通り。
/*
  1. カクテルの写真
  2. カクテルの名前
  3. カクテルの説明
  4. ベースのアルコール
  5. アルコール度数のレート

  表示する項目は、CockTail クラスのインスタンスから取得する。
 */
class CockTailListCard extends StatelessWidget {
  final CockTail cockTail;

  const CockTailListCard({required this.cockTail});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Row(
        children: <Widget>[
          Container(
            height: 125,
            width: 110,
            padding:
            EdgeInsets.only(left: 0, top: 10, bottom: 70, right: 20),
              decoration: BoxDecoration(
                color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
              ),
            child: Container()
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cockTail.name,
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                  ),
                  Text(
                    cockTail.description,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    cockTail.base.name,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.pink,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.pink,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.pink,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.pink,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.pink,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}