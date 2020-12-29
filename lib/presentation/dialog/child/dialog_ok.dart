import 'package:e_mobiz/common/styles/colors.dart';
import 'package:e_mobiz/presentation/widget/base/m_text.dart';
import 'package:e_mobiz/presentation/widget/custom/c_text_event.dart';
import 'package:flutter/material.dart';

class DialogOK extends StatelessWidget {
  String content;
  VoidCallback callBack;

  DialogOK(this.content, {this.callBack});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(
              20,
            ),
            child: MText(content, maxLine: 3, textAlign: TextAlign.center,),
          ),
          Container(
            height: 35,
            child: CTextEvent(
              "Ok",
              () {
                if(this.callBack != null){
                  this.callBack();
                }
                Navigator.of(context).pop();
              },
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
