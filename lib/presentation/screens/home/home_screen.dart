import 'package:e_mobiz/presentation/widget/base/m_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  
  static Future<dynamic> navigate(BuildContext context) async {
    return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: MText("Home screen"),
    ));
  }
}
