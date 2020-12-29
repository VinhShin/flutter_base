import 'package:flutter/material.dart';
import 'package:e_mobiz/common/styles/font_size.dart';

class MTextError  extends Text {

  TextAlign textAlign;
  double fontSize;
  FontWeight fontWeight;
  TextDecoration textDecoration;

  MTextError(String text,
      {
        this.fontSize = FontSize.small,
        this.textAlign = TextAlign.left,
        this.textDecoration = TextDecoration.none
      })
      : super(text,
      style: TextStyle(
          color: Colors.red,
          fontSize: fontSize,
          decoration: textDecoration),
      textAlign: textAlign);
}