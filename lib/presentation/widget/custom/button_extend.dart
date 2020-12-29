import 'package:flutter/material.dart';
import 'package:e_mobiz/common/styles/colors.dart';
import 'package:e_mobiz/common/styles/dimens.dart';
import 'package:e_mobiz/common/styles/style.dart';
import 'package:e_mobiz/presentation/widget/base/m_inkwell.dart';
import 'package:e_mobiz/presentation/widget/base/m_text.dart';

class ButtonExtend extends StatelessWidget {
  String content;
  VoidCallback onTap;

  ButtonExtend(this.content, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return MInkWell(
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: AppDimens.buttonHeight,
        decoration: AppStyle.boxDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MText(
              content,
              color: AppColors.primaryColor,
            ),
            Icon(Icons.chevron_right, color: AppColors.primaryColor)
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
