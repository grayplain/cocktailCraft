import 'dart:ffi';
import 'dart:math';

import 'package:booy/Entity/CockTail.dart';
import 'package:flutter/material.dart';

import 'AVBRateIcons.dart';

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
  bool isFavorite;

  CockTailListCard({required this.cockTail, required this.isFavorite});

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Row(
        children: <Widget>[
          Container(
            height: 125,
            width: 110,
            child: Image.asset( "images/" + cockTail.cocktailImageName, fit: BoxFit.scaleDown),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 200,
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 10.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      cockTail.base.name,
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AVBRateIcons(abvRate: cockTail.abvRate,
                      enableColor: Color.fromRGBO(128, 0, 128, 1.0),
                      disableColor: Color.fromRGBO(128, 0, 128, 0.2),
                      fontSize: 18),
                ],
              ),
            ),
          ),

      // Icon をタップすることで、 Icons.favorite_round に切り替わる
      //  Icons.favorite_round の状態で Icon をタップすることで、Icons.favorite_borderに切り替わる
          IconButton(
            iconSize: 25,
            padding: EdgeInsets.all(0),
            color: Colors.black,
            icon: Icon(isFavorite ? Icons.favorite_rounded : Icons.favorite_border),
            onPressed: () {
              isFavorite = !isFavorite;
            },
          )

        ],
      ),
    );
  }
}