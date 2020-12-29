import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_mobiz/common/styles/colors.dart';
import 'package:e_mobiz/common/styles/style.dart';
import 'package:e_mobiz/presentation/widget/base/m_inkwell.dart';

class TextFieldLock extends StatefulWidget {
  String label;
  String hint;
  Function onChanged;
  Function onSave;
  IconData icon;
  bool obscureText;
  bool isDisableEdit;
  String text;
  TextInputType textInputType;
  TextEditingController controller;

  TextFieldLock(this.icon, this.label,
      {this.onChanged,
      this.onSave,
      this.text,
      this.obscureText = false,
      this.textInputType,
      this.isDisableEdit = false,
      this.hint}) {
    controller = new TextEditingController(text: text);
  }

  @override
  _TextFieldLockState createState() => _TextFieldLockState();
}

class _TextFieldLockState extends State<TextFieldLock> {
  bool isLock = true;

  @override
  Widget build(BuildContext context) {
    var cursorPos = widget.controller.selection;

    if (cursorPos.start < widget.controller.text.length) {
      cursorPos = new TextSelection.fromPosition(new TextPosition(offset: widget.controller.text.length));
    }
    widget.controller.selection = cursorPos;

    return Container(
        decoration: AppStyle.boxDecorationShadow,
        margin: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
        child: FocusScope(
          child: Focus(
            onFocusChange: ((focus) {
              if (focus == false) {
                setState(() {
                  isLock = true;
                });
              }
            }),
            child: TextField(
                readOnly: isLock,
                obscureText: widget.obscureText,
                controller: widget.controller,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    focusColor: Colors.grey,
                    fillColor: Colors.grey[200],
                    hoverColor: Colors.grey[200],
                    hintText: widget.hint,
                    filled: isLock,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.transparent, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: AppColors.primaryColor, width: 1)),
                    prefixIcon: Icon(widget.icon),
                    suffixIcon: isLock ? editWidget() : saveWidget())),
          ),
        ));
  }

  Widget editWidget() {
    return MInkWell(
      child: Icon(Icons.edit),
      onTap: () {
        if(widget.isDisableEdit){
          widget.onSave().then((value){
            if(value != null) {
              setState(() {
                widget.controller.text = value;
              });
            }
          });
        } else {
          setState(() {
            isLock = !isLock;
          });
        }
      },
    );
  }

  Widget saveWidget() {
    return MInkWell(
      child: Icon(Icons.check),
      onTap: () {
        widget.onSave(widget.controller.text).then((value) {
          if (value) {
            setState(() {
              isLock = !isLock;
            });
          }
        });
      },
    );
  }
}
