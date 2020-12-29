import 'package:e_mobiz/common/styles/colors.dart';
import 'package:e_mobiz/presentation/widget/base/m_inkwell.dart';
import 'package:e_mobiz/presentation/widget/base/m_text.dart';
import 'package:flutter/material.dart';

class TextEvent extends StatelessWidget {
  String text;
  VoidCallback onTap;

  TextEvent(this.text, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return MInkWell(
      child: MText(
        text,
        color: AppColors.colorEvent,
        textDecoration: TextDecoration.underline,
      ),
      onTap: this.onTap,
    );
  }
}
