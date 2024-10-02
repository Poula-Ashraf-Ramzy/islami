import 'package:flutter/material.dart';
import 'package:flutter_application_1/colorApp.dart';
import 'package:flutter_application_1/home/Hadeth/Hadeth_Details_Screen.dart';
import 'package:flutter_application_1/home/Hadeth/hadeth.dart';
import 'package:flutter_application_1/home/Quran/Sura_Details_Screen.dart';

class ItemHadethName extends StatelessWidget {
  Hadeth hadeth;

  ItemHadethName({
    required this.hadeth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Text(hadeth.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
