import 'package:flutter/material.dart';
import 'package:e_mobiz/common/styles/style.dart';

class ImageCorner extends StatelessWidget {

  double size;
  String urlImage;
  EdgeInsets margin;

  ImageCorner(this.urlImage, this.size, {this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin??EdgeInsets.zero,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2, // has the effect of softening the shadow
              spreadRadius: 0, // has the effect of extending the shadow
              offset: Offset(
                0, // horizontal, move right 10
                1, // vertical, move down 10
              ),
            )
          ],
//          image: DecorationImage(image: AdvancedNetworkImage(
//            urlImage,
//            useDiskCache: true,
//            cacheRule: CacheRule(maxAge: const Duration(days: 7)),
//          ), fit: BoxFit.fill),
          borderRadius: BorderRadius.all(Radius.circular(size/5))),
      width: size,
      height: size,
    );
  }
}
