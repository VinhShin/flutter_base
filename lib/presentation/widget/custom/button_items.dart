import 'package:flutter/material.dart';
import 'package:e_mobiz/common/styles/colors.dart';
import 'package:e_mobiz/common/styles/dimens.dart';
import 'package:e_mobiz/common/styles/style.dart';
import 'package:e_mobiz/data/model/item_model.dart';
import 'package:e_mobiz/presentation/dialog/app_dialog.dart';
import 'package:e_mobiz/presentation/widget/base/m_inkwell.dart';
import 'package:e_mobiz/presentation/widget/base/m_text.dart';

class ButtonItems extends StatefulWidget {

  String content;
  String dialogTitle;
  ItemModel itemSelected;
  List<ItemModel> items;
  Function onItemChanged;

  ButtonItems(this.content,
      this.items,
      this.itemSelected, {
        this.onItemChanged,
        this.dialogTitle = "Chọn"
      });

  @override
  _ButtonItemsState createState() => _ButtonItemsState();
}

class _ButtonItemsState extends State<ButtonItems> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: AppDimens.buttonHeight,
      decoration: AppStyle.boxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MText(
            widget.content,
          ),
          Expanded(
            child: MInkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  MText(
                    widget.itemSelected.name,
                    color: AppColors.primaryColor,
                  ),
                  Icon(Icons.arrow_drop_down, color: AppColors.primaryColor)
                ],
              ),
              onTap: () {
                AppDialog.showDialogSelectItem(context, widget.dialogTitle, widget.items, widget.itemSelected).then((item){
                  if(item != null){
                    setState(() {
                      widget.itemSelected = item;
                    });
                    if(widget.onItemChanged != null){
                      widget.onItemChanged(item);
                    }
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
