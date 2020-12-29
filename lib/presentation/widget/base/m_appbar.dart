import 'package:flutter/material.dart';
import 'package:e_mobiz/common/styles/colors.dart';
import 'package:e_mobiz/common/styles/font_size.dart';

class MAppBar extends AppBar {

  String textTitle;
  List<Widget> actions;

  MAppBar(this.textTitle, {this.actions})
      : super(
            backgroundColor: AppColors.background,
            iconTheme: IconThemeData(color: AppColors.primaryColor),
            actions: actions,
            elevation: 1,
            title: Container(
              width: double.infinity,
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                textTitle,
                style: TextStyle(
                    color: AppColors.primaryColor, fontSize: FontSize.large, fontWeight: FontWeight.bold),
              ),
            ));
}
