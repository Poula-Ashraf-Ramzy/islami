import 'package:flutter/material.dart';
import 'package:flutter_application_1/colorApp.dart';
import 'package:flutter_application_1/home/setting/language_bottom_sheet.dart';
import 'package:flutter_application_1/home/setting/theme_bottom_sheet.dart';
import 'package:flutter_application_1/provider/App_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    Map<String, String> languages = {
      'en': AppLocalizations.of(context)!.english,
      'ar': AppLocalizations.of(context)!.arabic,
    };

    Map<String, String> mode = {
      'dark': AppLocalizations.of(context)!.dark,
      'light': AppLocalizations.of(context)!.light,
    };
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 25,
                  )),
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primaryLight_Color,
              ),
              child: InkWell(
                onTap: () {
                  showLanguageBottomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languages[provider.appLanguage]!,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.start,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                    ),
                  ],
                ),
              )),
          Text(AppLocalizations.of(context)!.mode,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 25,
                  )),
          Container(
              margin: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primaryLight_Color,
              ),
              child: InkWell(
                onTap: () {
                  showThemeBottomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.mode,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.start,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
