import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged onSearch;
  final TextEditingController _textEditingController = TextEditingController();
  
  SearchBar({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(const Radius.circular(24.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onSubmitted: onSearch,
          maxLines: 1,
          controller: _textEditingController,
          decoration: InputDecoration(
              icon: Icon(Icons.search),
              hintText: "ここに検索ワードを入力してください",
              border: InputBorder.none),
        ),
      ),
    );
  }
}
