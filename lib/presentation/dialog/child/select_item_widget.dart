import 'dart:convert';
import 'dart:ui';

import 'package:e_mobiz/common/styles/colors.dart';
import 'package:e_mobiz/data/model/item_model.dart';
import 'package:e_mobiz/presentation/widget/base/m_inkwell.dart';
import 'package:e_mobiz/presentation/widget/base/m_text.dart';
import 'package:e_mobiz/presentation/widget/custom/text_event.dart';
import 'package:flutter/material.dart';

class SelectItemWidget extends ModalRoute<ItemModel> {

  ItemModel itemSelected;
  String title;
  List<ItemModel> items;
  bool isShowDelete;

  static Future<ItemModel> navigate(BuildContext context, String title, List<ItemModel> items, ItemModel itemSelect, bool isShowDelete) {
    return Navigator.of(context).push(SelectItemWidget(title, items, itemSelect, isShowDelete));
  }

  SelectItemWidget(this.title, this.items, this.itemSelected, this.isShowDelete);

  Duration duration = Duration(milliseconds: 1);

  @override
  Duration get transitionDuration => duration;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.7);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 2, // has the effect of softening the shadow
                  spreadRadius: 0, // has the effect of extending the shadow
                  offset: Offset(
                    0, // horizontal, move right 10
                    1, // vertical, move down 10
                  ),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 10),
                    width: double.infinity,
                    height: 45,
                    alignment: AlignmentDirectional.centerStart,
                    child: MText(
                      title,
                      fontWeight: FontWeight.bold,
                    )),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: ItemsWidget(items, itemSelected.id, (id) {
                    this.itemSelected = id;
                  }),
                ),
                Divider(
                  height: 0.5,
                  color: Colors.grey,
                ),
                Container(
                  height: 45,
                  child: Row(
                    children: <Widget>[
                      if(isShowDelete)
                      TextEvent("Xóa", onTap:() {
                        Navigator.of(context).pop(ItemModel.removeItem());
                      }),
                      Spacer(),
                      TextEvent("Hủy", onTap:() {
                        Navigator.of(context).pop();
                      }),
                      TextEvent("OK",onTap: () {
                        Navigator.of(context).pop(itemSelected);
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}

class ItemsWidget extends StatefulWidget {
  Function callBack;
  String idSelected;
  List<ItemModel> items;

  ItemsWidget(this.items, this.idSelected, this.callBack);

  @override
  _ItemsWidgetState createState() => _ItemsWidgetState(idSelected);
}

class _ItemsWidgetState extends State<ItemsWidget> {
  String idSelected;

  _ItemsWidgetState(this.idSelected);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: widget.items.length,
        itemBuilder: (c, i) {
          return MInkWell(
              onTap: () {
                setState(() {
                  idSelected = widget.items[i].id;
                  widget.callBack(widget.items[i]);
                });
              },
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 30,
                            alignment: AlignmentDirectional.centerStart,
                            child: Icon(
                              widget.items[i].id == idSelected
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_unchecked,
                              color: Colors.grey[700],
                            )),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 20, bottom: 15, top: 15),
                            alignment: AlignmentDirectional.centerStart,
                            child: MText(
                              widget.items[i].name,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}
