import 'package:flutter/material.dart';
import 'package:e_mobiz/presentation/widget/base/m_text.dart';

class EmptyData extends StatelessWidget {
  String content;
  Widget child;

  EmptyData({this.content = "Không có dự liệu", this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: AlignmentDirectional.center,
      child: Column(
        children: <Widget>[
          MText(
            content,
            fontStyle: FontStyle.italic,
            color: Colors.grey,
          ),
          child ?? Container(),
        ],
      ),
    );
  }
}
