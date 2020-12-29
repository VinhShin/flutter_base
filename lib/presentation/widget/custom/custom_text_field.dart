import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  Function onChanged;
  String label;
  Widget prefixIcon;
  bool obscureText;

  CustomTextField({this.label = "", this.prefixIcon, this.onChanged, this.obscureText});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: TextField(
        obscureText: obscureText,  // hien thi kieu password
        onChanged: (text) {
          if (onChanged != null) {
            onChanged(text);
          }
        },


        style: TextStyle(
            backgroundColor: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,  // full background color for textfield
          filled: true,
          labelText: label,
          prefixIcon: Container(
            width: 40,
            child: prefixIcon ?? Container(),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
