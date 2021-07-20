import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: AnimatedContainer(
            // color: _selected ? Colors.black26 : Colors.redAccent,
            width: _selected ? 400 : 50,
            height: _selected ? 300 : 25,
            child: AutoSizeText(
              "NEWS FEED APP",
              style: TextStyle(fontSize: 40),
              minFontSize: 6,
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
            duration: Duration(seconds: 1),
            alignment: _selected ? Alignment.center : Alignment.topCenter,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "飛び出すよ",
          child: Icon(Icons.play_arrow),
          onPressed: () => setState(() => _selected = !_selected),
        ),
      ),
    );
  }
}
