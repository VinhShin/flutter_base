import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

import 'block_input.dart';

class CodeInput extends StatelessWidget {

  PublishSubject<String> codeStream = PublishSubject();

  CodeInput(this.codeStream);

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();

  String code1 = "";
  String code2 = "";
  String code3 = "";
  String code4 = "";
  String code5 = "";
  String code6 = "";

  checkValid(){
    codeStream.add("$code1$code2$code3$code4$code5$code6");
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (event) {
        print(event.logicalKey.keyLabel);
        if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
          print('check');
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlockInput(focusNode1, (String t) {
            if (t.isNotEmpty) {
              code1 = t;
              focusNode2.requestFocus();
              checkValid();
            }
          }),
          BlockInput(focusNode2, (t) {
            if (t.isNotEmpty) {
              focusNode3.requestFocus();
              code2 = t;
              checkValid();
            } else {
              focusNode1.requestFocus();
            }
          }),
          BlockInput(focusNode3, (t) {
            if (t.isNotEmpty) {
              code3 = t;
              focusNode4.requestFocus();
              checkValid();
            } else {
              focusNode2.requestFocus();
            }
          }),
          BlockInput(focusNode4, (t) {
            if (t.isNotEmpty) {
              code4 = t;
              focusNode5.requestFocus();
              checkValid();
            } else {
              focusNode3.requestFocus();
            }
          }),
          BlockInput(focusNode5, (t) {
            if (t.isNotEmpty) {
              code5 = t;
              focusNode6.requestFocus();
              checkValid();
            } else {
              focusNode4.requestFocus();
            }
          }),
          BlockInput(focusNode6, (t) {
            if (t.isEmpty) {
              focusNode5.requestFocus();
            } else {
              code6 = t;
              checkValid();
            }
          }),
        ],
      ),
    );
  }
}
