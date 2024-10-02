import 'package:flutter/material.dart';
import 'package:flutter_application_1/colorApp.dart';
import 'package:flutter_application_1/provider/App_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        Center(
            heightFactor: MediaQuery.of(context).size.height * 0.002,
            child: Image.asset('assets/images/radio_image.png')),
        Text(
          AppLocalizations.of(context)!.holyQuranRadio,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {},
                child: ImageIcon(
                  AssetImage('assets/images/Icon_back.png'),
                  color: provider.isDarkMode()
                      ? AppColor.yellowColor
                      : AppColor.primaryLight_Color,
                  size: 28,
                )),
            InkWell(
                onTap: () {},
                child: ImageIcon(AssetImage('assets/images/Icon_play.png'),
                    color: provider.isDarkMode()
                        ? AppColor.yellowColor
                        : AppColor.primaryLight_Color)),
            InkWell(
                onTap: () {},
                child: ImageIcon(AssetImage('assets/images/Icon_next.png'),
                    color: provider.isDarkMode()
                        ? AppColor.yellowColor
                        : AppColor.primaryLight_Color)),
          ],
        )
      ],
    );
  }
}
