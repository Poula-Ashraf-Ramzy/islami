import 'package:flutter/material.dart';
import 'package:flutter_application_1/colorApp.dart';

class HadethDetails extends StatelessWidget {
  String contents;

  int indexs;

  HadethDetails({required this.contents, required this.indexs});

  @override
  Widget build(BuildContext context) {
    return Text('$contents (${indexs + 1})',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium);
  }
}
