import 'package:e_mobiz/presentation/widget/base/m_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_mobiz/common/styles/style.dart';
import 'package:e_mobiz/presentation/widget/base/m_text_error.dart';

class MTextFieldShadow extends StatelessWidget {
  String label;
  Function onChanged;
  IconData icon;
  TextEditingController controller;
  bool obscureText;
  bool readonly;
  bool showError;
  Widget suffixIcon;
  int maxline;
  TextInputType textInputType;

  MTextFieldShadow(
      this.icon,
      this.label,
      {this.onChanged,
        String text = "",
        this.obscureText = false,
        this.readonly = false,
        this.suffixIcon,
        this.maxline = 1,
        this.showError = false,
        this.textInputType,
      })
  {
    controller = new TextEditingController(text: text);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: AppStyle.boxDecorationShadow,
        margin: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Icon(
                  icon,
                  color: Colors.grey,
                ),

                Expanded(
//              child: TextField(),
                  child: MTextField(
                    maxline: maxline,
                    controller: controller,
                    onTextChanged: onChanged,
                    label: label,
                    textInputType: textInputType,
                    readonly:  readonly,
                    obscureText: obscureText,
                    suffixIcon: suffixIcon,
                    inputBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.transparent, width: 1)),
                  ),
                ),
              ],
            ),
            if (showError)
              Positioned(
                top: 15,
                right: 10,
                child: MTextError("* bắt buộc"),
              )
          ],
        ));
  }
}
