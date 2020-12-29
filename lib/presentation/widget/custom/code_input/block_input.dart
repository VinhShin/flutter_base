import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlockInput extends StatelessWidget {
  FocusNode focusNode;
  Function onTextChanged;

  BlockInput(this.focusNode, this.onTextChanged);
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    InputBorder inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)), borderSide: BorderSide(color: Colors.grey, width: 1));
    cursorEnd();


    return Container(
      height: 40,
      width: 40,
//        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: TextField(
          controller: _controller,
          keyboardType: TextInputType.phone,
          onChanged: (text){
            if(text.isNotEmpty && text.length > 1){
              text = text.substring(text.length-1, text.length);
              _controller.text = text;
              cursorEnd();
            } else{
            }
            onTextChanged(text);

          },
          focusNode: focusNode,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, right: 10),
              focusColor: Colors.white,
              fillColor: Colors.white,
              hoverColor: Colors.white,
              filled: true,
              enabledBorder: inputBorder,
              focusedBorder: inputBorder)),
    );
  }

  void cursorEnd(){
    var cursorPos = _controller.selection;

    if (cursorPos.start < _controller.text.length) {
      cursorPos = new TextSelection.fromPosition(new TextPosition(offset: _controller.text.length));
    }
    _controller.selection = cursorPos;
  }
}
