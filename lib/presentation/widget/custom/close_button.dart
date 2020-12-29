import 'package:e_mobiz/presentation/widget/base/m_inkwell.dart';
import 'package:flutter/material.dart';

class CloseButton extends StatelessWidget {

  VoidCallback onPress;


  CloseButton(this.onPress);

  @override
  Widget build(BuildContext context) {
    return  MInkWell(
      onTap: onPress,
      child: Container(
          margin: EdgeInsets.all(5),
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(12.5))),
          child: Icon(
            Icons.clear,
            color: Colors.white,
            size: 15,
          )),
    );
  }
}
