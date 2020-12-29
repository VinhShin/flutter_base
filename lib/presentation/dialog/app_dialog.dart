import 'package:e_mobiz/presentation/bloc/general/dialog_state.dart';
import 'package:e_mobiz/common/styles/font_size.dart';
import 'package:e_mobiz/data/model/item_model.dart';
import 'package:e_mobiz/data/model/marker_point.dart';
import 'package:flutter/material.dart';
import 'child/dialog_ok.dart';
import 'child/dialog_ok_cancel.dart';
import 'child/search_place_dialog.dart';
import 'child/select_item_widget.dart';
import 'child/select_widget.dart';

class AppDialog extends SimpleDialog {
  AppDialog(Widget child, {String title})
      : super(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      )),
                  padding: EdgeInsets.only(left: 10),
                  width: double.infinity,
                  height: 49,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    title ?? "Thông báo",
                    style: TextStyle(fontSize: FontSize.large, color: Colors.black),
                  )),
//              Divider(
//                height: 1,
//                color: Colors.grey,
//              )
            ],
          ),
          children: [child],
        );

  static showDialogSelect(
      BuildContext context, String title, List<ItemModel> items, String idSelected, Function callBack) {
    print(idSelected);
    showDialog(
        context: context,
        builder: (_) {
          return AppDialog(SelectWidget(title, items, idSelected, callBack));
        });
  }

  static showDialogOneButton(BuildContext context, String content, {String title}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AppDialog(
            DialogOK(content),
            title: title,
          );
        });
  }

  static showDialogOK(BuildContext context, DialogState dialogState, {VoidCallback dialogCallBack}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AppDialog(
            DialogOK(dialogState.content, callBack: dialogCallBack),
            title: dialogState.title,
          );
        });
  }

  static showDialogOkCancel(BuildContext context, DialogState dialogState, VoidCallback positiveCallback) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AppDialog(
            DialogOkCancel(dialogState, positiveCallback),
            title: dialogState.title,
          );
        });
  }

  static showDialogNoNetWork(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AppDialog(
            DialogOK("Bạn cần kết nối mạng để thao tác chức năng!"),
            title: "Thông báo",
          );
        });
  }

  static Future<MarkerPoint> showDialogSearchPlace(BuildContext context) {
    return SearchPlaceDialog.navigate(context);
  }

  static Future<ItemModel> showDialogSelectItem(
      BuildContext context, String title, List<ItemModel> items, ItemModel itemModel,
      {bool isShowDelete = false}) {
    return SelectItemWidget.navigate(context, title, items, itemModel, isShowDelete);
  }

  static show(BuildContext context, DialogState dialogState, {Function dialogCallback}) {
    if (dialogState is DialogOK) {
      return showDialogOK(context, dialogState);
    }
  }
}
