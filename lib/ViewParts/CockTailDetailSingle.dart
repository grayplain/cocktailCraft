
import 'dart:math';

import 'package:flutter/material.dart';

import '../Entity/CockTail.dart';


class CockTailDetailSingle extends StatelessWidget {
static final String path = "lib/src/pages/hotel/details.dart";
final String image = "assets/hotel/room3.jpg";
CockTail cockTail;

// cockTail は CockTailDetail から受け取る
CockTailDetailSingle({required this.cockTail});

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: <Widget>[
        Container(
            foregroundDecoration: BoxDecoration(color: Colors.black26),
            height: 400,
            child: Image.asset(image, fit: BoxFit.cover)),
        SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 250),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  cockTail.name,
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
                      "8.4/85 reviews",
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
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.purple,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.purple,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.purple,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.purple,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.purple,
                                  ),
                                ],
                              ),
                              Text.rich(
                                TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(
                                        Icons.location_on,
                                        size: 16.0,
                                        color: Colors.grey,
                                      )),
                                  TextSpan(text: "8 km to centrum")
                                ]),
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),

                    const SizedBox(height: 30.0),
                    Text(
                      "説明",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14.0),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      cockTail.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 14.0),
                    ),
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