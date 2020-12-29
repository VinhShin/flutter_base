import 'package:flutter/material.dart';


class MTextField extends TextField {
  MTextField({
    Function onTextChanged,
    TextEditingController controller,
    String suffixText = "",
    Color color,
    String label = "",
    int maxline = 1,
    String hint = "",
    Color hintColor,
    bool autoFocus = false,
    bool obscureText = false,
    bool readonly = false,
    TextInputType textInputType = TextInputType.text,
    Widget prefixIcon,
    suffixIcon,
    InputBorder inputBorder = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide(color: Colors.grey, width: 1)),
  }) : super(
            keyboardType: textInputType,
            autofocus: autoFocus,
            maxLines:maxline,
            readOnly: readonly,
            obscureText: obscureText,
            controller: controller,
            onChanged: onTextChanged,
//            focusNode: MFocusNode(),
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(color: color ?? Colors.black),
            decoration: InputDecoration(
                labelText: label,
                hintText: hint,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                suffixText: suffixText,
                contentPadding: EdgeInsets.only(top: 1, bottom: 1, left: 10, right: 10),
                enabledBorder: inputBorder,
                focusedBorder: inputBorder,
                hintStyle: TextStyle(color: hintColor ?? Colors.grey)));
}
