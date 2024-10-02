import 'package:flutter/material.dart';
import 'package:flutter_application_1/colorApp.dart';
import 'package:flutter_application_1/provider/App_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    ThemeMode currentTheme = provider.appThemeMode;
    return Container(
      color: provider.isDarkMode()
          ? AppColor.primaryDark_Color
          : AppColor.primaryLight_Color,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              setState(() {});
            },
            child: currentTheme == ThemeMode.dark
                ? getSelectedThemeMode(AppLocalizations.of(context)!.dark)
                : getUnSelectedThemeMode(AppLocalizations.of(context)!.dark),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              setState(() {});
            },
            child: currentTheme == ThemeMode.light
                ? getSelectedThemeMode(AppLocalizations.of(context)!.light)
                : getUnSelectedThemeMode(AppLocalizations.of(context)!.light),
          ),
        ],
      ),
    );
  }

  Widget getSelectedThemeMode(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColor.whiteColor)),
        Icon(
          Icons.check,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget getUnSelectedThemeMode(String text) {
    return Text(text, style: Theme.of(context).textTheme.bodySmall);
  }
}
