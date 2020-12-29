import 'package:e_mobiz/presentation/widget/base/m_text.dart';
import 'package:e_mobiz/presentation/widget/base/m_text_field.dart';
import 'package:flutter/material.dart';

class TitleField extends StatelessWidget {

  String title;
  Function onTextChanged;


  TitleField(this.title, this.onTextChanged);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MText.title(title),
        MTextField(onTextChanged: onTextChanged,),
      ],
    );
  }
}
