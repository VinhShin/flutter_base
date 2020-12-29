
import 'package:flutter/material.dart';
import 'package:e_mobiz/common/styles/colors.dart';
import 'package:e_mobiz/common/styles/style.dart';

class STextField extends StatefulWidget {

  String hint;
  String label;
  IconData icon;
  String text;
  Function onChanged;
  bool obscureText;
  Color color;
  TextEditingController controller;
  TextInputType keyboardType;


  STextField({
    this.icon,
    this.label,
    this.hint,
    this.text,
    this.onChanged,
    this.color,
    this.obscureText = false,
    this.controller,
    this.keyboardType
  }){
    if(controller == null){
      controller = TextEditingController(text: text);
      controller.addListener(() {
        onChanged(controller.text);
      });
    }
  }

  @override
  _STextFieldState createState() => _STextFieldState();

}

class _STextFieldState extends State<STextField> {

  bool isFocus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FocusScope(
        child: Focus(
          onFocusChange: (focus) {
            setState(() {
              isFocus = focus;
            });
          },
          child: TextField(
              keyboardType: widget.keyboardType,
              maxLines: 1,
              controller: widget.controller,
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                  prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
                  contentPadding: EdgeInsets.only(left: 10, right: 10),
                  focusColor: Colors.grey,
                  hintText: widget.hint,
                  labelText: widget.label,
                  filled: !isFocus,
                  enabledBorder: isFocus ? AppStyle.inputBorderPrimary : AppStyle.inputBorder,
                  focusedBorder: isFocus ? AppStyle.inputBorderPrimary : AppStyle.inputBorder)),
        ),
      ),
    );
  }
}
