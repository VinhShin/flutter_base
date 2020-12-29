import 'package:e_mobiz/data/model/item_model.dart';
import 'package:e_mobiz/presentation/widget/base/m_inkwell.dart';
import 'package:e_mobiz/presentation/widget/base/m_text.dart';
import 'package:flutter/material.dart';

class SelectWidget extends StatelessWidget {
  String title;
  List<ItemModel> items;
  String idSelected;
  Function callBack;

  SelectWidget(this.title, this.items, this.idSelected, this.callBack);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List<Widget> widgets = List();
    for (int i = 0; i < items.length; i++) {
      widgets.add(MInkWell(
          onTap: () {
            callBack(items[i]);
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                        height: 30,
                        alignment: AlignmentDirectional.centerStart,
                        child: Icon(
                          items[i].id == idSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                          color: Colors.grey[700],
                        )),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20, bottom: 15, top: 15),
                        alignment: AlignmentDirectional.centerStart,
                        child: MText(
                          items[i].name,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )));
    }

    return Column(
      children: <Widget>[
//          SingleChildScrollView(
//            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets),
//          ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (c, i) {
              return MInkWell(
                  onTap: () {
                    callBack(items[i]);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            new Container(
                                height: 30,
                                alignment: AlignmentDirectional.centerStart,
                                child: Icon(
                                  items[i].id == idSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                                  color: Colors.grey[700],
                                )),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 20, bottom: 15, top: 15),
                                alignment: AlignmentDirectional.centerStart,
                                child: MText(
                                  items[i].name,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ));
            }),
        Divider(height: 1,color: Colors.grey,),
        Container(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text("Hủy"),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text("OK"),
              ),
            ],
          ),
        )
      ],
    );

    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (c, i) {
          return MInkWell(
              onTap: () {
                callBack(items[i]);
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new Container(
                            height: 30,
                            alignment: AlignmentDirectional.centerStart,
                            child: Icon(
                              items[i].id == idSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                              color: Colors.grey[700],
                            )),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 20, bottom: 15, top: 15),
                            alignment: AlignmentDirectional.centerStart,
                            child: MText(
                              items[i].name,
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
