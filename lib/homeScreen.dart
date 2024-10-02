import 'package:flutter_application_1/provider/App_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/Hadeth/hadeth.dart';
import 'package:flutter_application_1/home/Quran/quran.dart';
import 'package:flutter_application_1/home/Radio/radio.dart';
import 'package:flutter_application_1/home/Sebha/sebha.dart';
import 'package:flutter_application_1/home/setting/setting.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  static const String routName = "Home";

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
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
              elevation: 0,
              title: Center(
                  child: Text(
                AppLocalizations.of(context)!.app_title,
                style: Theme.of(context).textTheme.bodyLarge,
              ))),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: num,
              onTap: (value) {
                num = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon:
                        ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage('assets/images/head_sebha_dark.png')),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),
          body: screenTap[num],
        ),
      ],
    );
  }

  List<Widget> screenTap = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    Settings()
  ];
}
