import 'package:flutter/material.dart';
import 'package:e_mobiz/presentation/widget/base/m_text.dart';
import 'package:e_mobiz/presentation/widget/custom/text_event.dart';
import 'package:rxdart/rxdart.dart';

class CountDown extends StatefulWidget {
  int time;
  VoidCallback onResend;
  PublishSubject<bool> countStream;

  CountDown(this.time, this.onResend, this.countStream);

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  int currentTime;
  bool isStop = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentTime = widget.time;
    countDown();
  }

  countDown() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        currentTime--;
      });
      if(currentTime > 0) {
        countDown();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(currentTime <=0){
      return TextEvent("Gửi lại",onTap:(){
        widget.onResend();
        currentTime = widget.time;
        countDown();
      });
    }
    return MText(currentTime?.toString()??"");
  }
}
