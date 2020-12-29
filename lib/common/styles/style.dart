import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_size.dart';

class AppStyle {
  static TextStyle get styleTextNormal {
    return const TextStyle(fontSize: FontSize.normal, color: Colors.black);
  }

  static TextStyle get styleTextNormalBold {
    return const TextStyle(fontSize: FontSize.normal, color: Colors.black, fontWeight: FontWeight.bold);
  }

  static TextStyle get styleTextTitle {
    return const TextStyle(fontSize: FontSize.xlarge, color: Colors.black);
  }

  static TextStyle get styleTextTitleBold {
    return const TextStyle(fontSize: FontSize.large, color: Colors.black, fontWeight: FontWeight.bold);
  }

  static TextStyle get textStyleHint {
    return const TextStyle(fontSize: FontSize.small, color: AppColors.hintColor);
  }

  static TextStyle get textStyleHintBold {
    return const TextStyle(fontSize: FontSize.small, color: AppColors.hintColor, fontWeight: FontWeight.bold);
  }

  static TextStyle get textStyleEvent {
    return const TextStyle(fontSize: FontSize.normal, color: AppColors.colorEvent);
  }

  static BoxDecoration get boxDecoration {
    return BoxDecoration(color: AppColors.widgetDefault, borderRadius: BorderRadius.all(borderRadius));
  }

  static BoxDecoration get boxDecorationShadow {
    return BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2, // has the effect of softening the shadow
            spreadRadius: 0, // has the effect of extending the shadow
            offset: Offset(
              0, // horizontal, move right 10
              1, // vertical, move down 10
            ),
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(25)));
  }

  static BoxDecoration get boxDecorationShadow2 {
    return BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 0.5, // has the effect of softening the shadow
            spreadRadius: 0, // has the effect of extending the shadow
            offset: Offset(
              0, // horizontal, move right 10
              0.5, // vertical, move down 10
            ),
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(20)));
  }

  static LinearGradient get linearGradient {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
      colors: [
        Colors.white, Colors.white
//        Color(0xff5F26FF),Color(0xffb25ce1)
      ], // whitish to gray// repeats the gradient over the canvas
    );
  }

  static Radius get borderRadius {
    return Radius.circular(20);
  }

  static InputBorder get inputBorderPrimary {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(borderRadius), borderSide: BorderSide(color: AppColors.primaryColor, width: 1));
  }

  static InputBorder get inputBorder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(borderRadius), borderSide: BorderSide(color: Colors.transparent, width: 1));
  }

  static LinearGradient get linearGradientColor {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment(0.1, 0.1), // 10% of the width, so there are ten blinds.
      colors: [
        Colors.greenAccent,
        AppColors.primaryColor
      ], // whitish to gray// repeats the gradient over the canvas
    );
  }

  static BoxDecoration get boxDecorationShadowButton1 {
    return BoxDecoration(
      color: AppColors.primaryColor,
      boxShadow: [
        BoxShadow(
          color: Colors.grey[400],
          blurRadius: 5, // has the effect of softening the shadow
          spreadRadius: 1, // has the effect of extending the shadow
          offset: Offset(
            0, // horizontal, move right 10
            2, // vertical, move down 10
          ),
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(25)),
      //border: Border.all(width: 1, color: Colors.grey)
    );
  }

    static BoxDecoration boxDecorationShadowButton({Color color = AppColors.primaryColor}) {
    return BoxDecoration(
      color: color,
      boxShadow: [
        BoxShadow(
          color: Colors.grey[400],
          blurRadius: 5, // has the effect of softening the shadow
          spreadRadius: 1, // has the effect of extending the shadow
          offset: Offset(
            0, // horizontal, move right 10
            2, // vertical, move down 10
          ),
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(25)),
      //border: Border.all(width: 1, color: Colors.grey)
    );
  }

}
