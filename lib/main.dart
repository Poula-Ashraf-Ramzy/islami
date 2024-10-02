import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/Hadeth/Hadeth_Details_Screen.dart';
import 'package:flutter_application_1/home/Quran/Sura_Details_Screen.dart';
import 'package:flutter_application_1/provider/App_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_application_1/homeScreen.dart';
import 'package:flutter_application_1/my_thame.dart';
import 'package:flutter_application_1/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: MyAppIslami()));
}

class MyAppIslami extends StatelessWidget {
  const MyAppIslami({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Homescreen.routName,
      routes: {
        //SplashScreen.routName:(context)=>SplashScreen(),
        Homescreen.routName: (context) => Homescreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      theme: MyThemeData.liteModeApp,
      themeMode: provider.appThemeMode,
      darkTheme: MyThemeData.darkModeApp,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
