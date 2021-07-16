import 'package:flutter/material.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => onRefresh(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // SearchBar(),
            // CategoryChips(),
            Expanded(child: Center(child: CircularProgressIndicator()))
          ],
        ),
      ),
    ));
  }

  onRefresh() {}
}
