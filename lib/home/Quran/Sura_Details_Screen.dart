import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/colorApp.dart';
import 'package:flutter_application_1/home/Quran/item_Sura_Details.dart';
import 'package:flutter_application_1/provider/App_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'SuraDetails';

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    loadFile(args.index);
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
                  child: Text(args.name,
                      style: Theme.of(context).textTheme.bodyLarge))),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColor.primaryLight_Color,
                ))
              : Container(
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
                        color: provider.isDarkMode()
                            ? AppColor.yellowColor
                            : AppColor.primaryLight_Color,
                        thickness: 1,
                      );
                    },
                    itemBuilder: (context, index) {
                      return ItemSuraDetails(
                          content: verses[index], index: index);
                    },
                    itemCount: verses.length,
                  ),
                ),
        ),
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
