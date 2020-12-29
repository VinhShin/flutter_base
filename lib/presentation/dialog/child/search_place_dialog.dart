import 'dart:convert';
import 'dart:ui';

import 'package:e_mobiz/data/model/marker_point.dart';
import 'package:e_mobiz/presentation/widget/custom/places_auto_complete.dart';
import 'package:flutter/material.dart';

class SearchPlaceDialog extends ModalRoute<MarkerPoint> {

  static Future<MarkerPoint> navigate(BuildContext context) {
    return Navigator.of(context).push(SearchPlaceDialog());
  }

  Duration duration = Duration(milliseconds: 1);

  @override
  Duration get transitionDuration => duration;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

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
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: PlacesAutocompleteWidget(
          callBack: (markerPoint){
            duration = Duration(microseconds: 100);
            Navigator.of(context).pop(markerPoint);
          },
          onClose: (){
          Navigator.of(context).pop();
        },),
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
