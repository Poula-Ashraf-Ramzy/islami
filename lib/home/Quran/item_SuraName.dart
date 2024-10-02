import 'package:flutter/material.dart';
import 'package:flutter_application_1/colorApp.dart';
import 'package:flutter_application_1/home/Quran/Sura_Details_Screen.dart';

class ItemSuraname extends StatelessWidget {
  String names;

  int index;

  ItemSuraname({required this.names, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name: names, index: index));
      },
      child: Text(names,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
