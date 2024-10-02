import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/colorApp.dart';
import 'package:flutter_application_1/home/Hadeth/Hadeth_Details.dart';
import 'package:flutter_application_1/home/Hadeth/hadeth.dart';
import 'package:flutter_application_1/home/Quran/item_Sura_Details.dart';
import 'package:flutter_application_1/provider/App_provider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'HadethDetails';

  HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Stack(
      children: [
        provider.isDarkMode()
            ? Positioned.fill(
                child: Image.asset(
                'assets/images/dark_bg.png',
                fit: BoxFit.cover,
              ))
            : Positioned.fill(
                child: Image.asset(
                'assets/images/light_bg.png',
                fit: BoxFit.cover,
              )),
        Scaffold(
          appBar: AppBar(
              title: Center(
                  child: Text(
            args.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ))),
          body: Container(
            decoration: BoxDecoration(
              color: provider.isDarkMode()
                  ? AppColor.primaryDark_Color
                  : Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06,
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: Color(0xffB7935F),
                  thickness: 2,
                );
              },
              itemBuilder: (context, index) {
                return Text(
                  args.content[index],
                  textAlign: TextAlign.center,
                );
              },
              itemCount: args.content.length,
            ),
          ),
        ),
      ],
    );
  }
}
