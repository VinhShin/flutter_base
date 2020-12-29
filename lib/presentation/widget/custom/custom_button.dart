import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  String text;
  Function onPressed;

  CustomButtons(this.text,this.onPressed);

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: RaisedButton(
          onPressed: onPressed,
          color: Colors.white,
          child: Text(text,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonSmall extends StatelessWidget{
  String text;
  Function onPressed;
  ButtonSmall(this.text, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: SizedBox(
        height: 50,
        child: RaisedButton(
          onPressed: onPressed,
          color: Colors.white,
          child: Text(text,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
