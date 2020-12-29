import 'package:flutter/material.dart';
import 'package:e_mobiz/common/styles/font_size.dart';

class MText extends Text {

  TextAlign textAlign;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  TextDecoration textDecoration;
  FontStyle fontStyle;
  int maxLine;

  MText(String text,
      {this.color,
      this.fontSize = FontSize.normal,
      this.textAlign = TextAlign.left,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.maxLine = 1,
      this.textDecoration = TextDecoration.none})
      : super(text,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLine,
            style: TextStyle(
                color: color ?? Colors.black,
                fontSize: fontSize,
                decoration: textDecoration,
                fontWeight: fontWeight,
                fontStyle: fontStyle),
            textAlign: textAlign);

  factory MText.bold(String text){
    return  MText(text, fontWeight:FontWeight.bold);
  }

  factory MText.title(String text){
    return MText(text, fontWeight:FontWeight.bold);
  }
}
