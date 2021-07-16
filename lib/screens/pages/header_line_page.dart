import 'package:flutter/material.dart';

class HeaderLinePage extends StatelessWidget {
  const HeaderLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Text("header"),
      ),
    );
  }
}
