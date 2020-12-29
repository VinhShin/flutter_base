import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_mobiz/common/styles/colors.dart';

class FullLoading extends StatelessWidget {
  bool isLoading;

  FullLoading(this.isLoading);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return isLoading
        ? Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black12.withOpacity(0.4),
              ),
              Center(
                  child: CircularProgressIndicator(backgroundColor: AppColors.primaryColor,valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),)
            ],
          )
        : Container();
  }
}
