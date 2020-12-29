import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_mobiz/common/styles/colors.dart';
import 'package:e_mobiz/common/styles/font_size.dart';
import 'package:e_mobiz/common/styles/style.dart';

import 'm_text.dart';

class MButton extends StatelessWidget {

  Function onPressed;
  String text;
  Color color;

  MButton(this.text, this.onPressed, {this.color = AppColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Container(
        height: 45,
        alignment: AlignmentDirectional.center,
        decoration: AppStyle.boxDecorationShadowButton(color: color),
        child: MText(text, color: Colors.white, fontSize: FontSize.large, fontWeight: FontWeight.bold,),
      ),
      onTap: onPressed,
    );
  }
}
