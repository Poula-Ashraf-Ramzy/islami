import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/Quran/Sura_Details_Screen.dart';

class ItemSuraDetails extends StatelessWidget {
  String content;

  int index;

  ItemSuraDetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$content (${index + 1})',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
