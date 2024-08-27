import 'package:flutter/material.dart';
import 'package:news_c11_online/models/SourcesResponse.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;

  TabItem({required this.source, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.green)),
        child: Text(
          source.name ?? "",
          style: TextStyle(
              fontSize: 14, color: isSelected ? Colors.white : Colors.green),
        ));
  }
}
