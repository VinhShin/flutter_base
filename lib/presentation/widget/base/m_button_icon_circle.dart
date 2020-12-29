import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MButtonIconCircle extends StatelessWidget {
  Function callBack;
  Widget icon;
  Color colorShadhow;
  double size;

  MButtonIconCircle(this.icon, this.callBack, {this.colorShadhow = Colors.grey, this.size = 45});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Container(
        width: size,
        height: size,
        child: icon,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color:  colorShadhow,
                blurRadius: 2, // has the effect of softening the shadow
                spreadRadius: 0, // has the effect of extending the shadow
                offset: Offset(
                  0, // horizontal, move right 10
                  1, // vertical, move down 10
                ),
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(22.5))),
      ),
      onTap: (){
        callBack();
      },
    );
  }
}
