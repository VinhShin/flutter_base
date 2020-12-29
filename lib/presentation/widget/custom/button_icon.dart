import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_mobiz/common/styles/colors.dart';
import 'package:e_mobiz/common/styles/style.dart';

class ButtonIcon extends StatelessWidget {

  IconData icon;
  Function onPressed;

  ButtonIcon(this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return InkWell(
        child: Container(
          alignment: AlignmentDirectional.center,
          padding: EdgeInsets.all(2),
          decoration: AppStyle.boxDecorationShadow,
          child: Icon(icon, color: AppColors.primaryColor,),
        ),
        onTap: () {
          onPressed();
        },
      );
  }
}
