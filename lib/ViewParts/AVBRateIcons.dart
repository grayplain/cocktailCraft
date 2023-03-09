//AbvRate の enum を受け取り、6つの Icon Widget を内包した Widget を返却する

import '../Entity/AbvRate.dart';
import '../IconData/cocktal_craft__a_v_b_icons.dart';
import 'package:flutter/material.dart';

class AVBRateIcons extends StatelessWidget {
  AbvRate abvRate;
  Color enableColor;
  Color disableColor;
  int fontSize;
  AVBRateIcons(
      {Key? key,
        required this.abvRate,
        required this.enableColor,
        required this.disableColor,
        required this.fontSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(int i = 0; i < 6; i++) ... {
          Icon(
            CocktalCraft_AVB.glass,
            size: fontSize.toDouble(),
            color: abvRate.index <= i
                ? disableColor
                : enableColor,
          ),
        },
      ],
    );
  }
}

// Path: lib/ViewParts/AVBRateIcons.dart
// Compare this snippet from lib/Entity/AbvRate.dart:
