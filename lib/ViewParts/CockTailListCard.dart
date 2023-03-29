import 'dart:ffi';
import 'dart:math';

import 'package:booy/Entity/CockTail.dart';
import 'package:booy/Entity/Favorite.dart';
import 'package:flutter/material.dart';

import '../View/CockTailList.dart';
import 'AVBRateIcons.dart';

class CockTailListCard extends StatefulWidget {
  final CockTail cockTail;
  Favorite isFavorite;
  Function favoriteCallback;

  CockTailListCard({required this.cockTail, required this.isFavorite, required this.favoriteCallback});

  @override
  _CockTailListCardState createState() => _CockTailListCardState();
}

class _CockTailListCardState extends State<CockTailListCard> {
  @override
  Widget build(BuildContext context) {

    return Card(
      child: Row(
        children: <Widget>[
          Container(
            height: 125,
            width: 110,
            child: Image.asset( "images/" + widget.cockTail.cocktailImageName, fit: BoxFit.scaleDown),
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
                    widget.cockTail.name,
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                  ),
                  Text(
                    widget.cockTail.description,
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
                      widget.cockTail.base.name,
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AVBRateIcons(abvRate: widget.cockTail.abvRate,
                      enableColor: Color.fromRGBO(128, 0, 128, 1.0),
                      disableColor: Color.fromRGBO(128, 0, 128, 0.2),
                      fontSize: 18),
                ],
              ),
            ),
          ),

          IconButton(
            iconSize: 25,
            padding: EdgeInsets.all(0),
            color: Colors.black,
            icon: Icon(widget.isFavorite.isFavorite ? Icons.favorite_rounded : Icons.favorite_border),
            onPressed: () {
              widget.favoriteCallback(widget.cockTail.cocktailID);
              setState(() {
                widget.isFavorite.isFavorite = !widget.isFavorite.isFavorite;
              });
            },
          )

        ],
      ),
    );
  }
}
