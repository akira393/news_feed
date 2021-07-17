import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';

class CategoryChips extends StatefulWidget {
  final ValueChanged onCategorySelected;
  CategoryChips({required this.onCategorySelected});

  @override
  _CategoryChipsState createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  var value = 0;//選択されたカテゴリーのindexを保存する状態変数
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.0,
      children: List<Widget>.generate(
        categories.length,
        (int index) {
          return ChoiceChip(
            label: Text(categories[index].nameJp),
            selected: value == index,
            onSelected: (bool isSelected) {
              setState(() {
                // value = isSelected ? index : 0;//二度押しすると総合に戻っちゃうのでなし
                value=index;
                widget.onCategorySelected(categories[index]);
              });
            },
          );
        },
      ).toList(),
    );
  }
}
