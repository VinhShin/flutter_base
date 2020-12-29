import 'package:flutter/material.dart';
import 'package:e_mobiz/common/styles/font_size.dart';

class MTextHint extends Text {
  Colors color;

  MTextHint(String text, {Color color, int maxline = 1})
      : super(text,
            overflow: TextOverflow.ellipsis,
            maxLines:maxline,
            style: TextStyle(color: color ?? Colors.black, fontSize: FontSize.small));
}
