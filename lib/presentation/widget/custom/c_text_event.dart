import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_mobiz/presentation/widget/base/m_inkwell.dart';
import 'package:e_mobiz/presentation/widget/base/m_text.dart';

class CTextEvent extends StatelessWidget {

  VoidCallback callBack;

  String text;
  Color color;

  CTextEvent(this.text, this.callBack, {this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MInkWell(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: MText(text, color: color),
      ),
      onTap: callBack,
    );
  }
}
