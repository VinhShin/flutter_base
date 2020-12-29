import 'package:flutter/material.dart';

class MInkWell extends InkWell{
  MInkWell({Widget child, Function onTap}): super(child:child, onTap: onTap,focusColor:Colors.transparent,hoverColor:Colors.transparent, highlightColor: Colors.transparent, splashColor:Colors.transparent);
}