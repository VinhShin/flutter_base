import 'package:e_mobiz/presentation/bloc/general/dialog_state.dart';
import 'package:e_mobiz/presentation/widget/custom/text_event.dart';
import 'package:flutter/material.dart';

class DialogOkCancel extends StatelessWidget {
  DialogState dialogState;
  VoidCallback positiveCallback;

  DialogOkCancel(this.dialogState, this.positiveCallback);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(
              20,
            ),
            child: Text(dialogState.content),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 35,
                child: TextEvent(
                  "Không",
                  onTap: () {
                    Navigator.pop(context);
                  }
                ),
              ),
              Container(
                height: 35,
                child: TextEvent(
                  "Có",
                  onTap: () {
              positiveCallback();
                  }
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
