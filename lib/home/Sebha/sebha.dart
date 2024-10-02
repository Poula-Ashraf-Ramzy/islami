import 'package:flutter/material.dart';
import 'package:flutter_application_1/colorApp.dart';
import 'package:flutter_application_1/provider/App_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTap extends StatefulWidget {
  @override
  _SebhaTapState createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int tasbeehCount = 0;
  String tasbeehName = 'سبحان الله';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Stack(
      children: [
        Positioned(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 1.08,
          child: Center(
            child: provider.isDarkMode()
                ? Image.asset(
                    'assets/images/head_sebha_dark.png',
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/head_sebha_logo.png',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Center(
          heightFactor: MediaQuery.of(context).size.height * 0.0023,
          child: provider.isDarkMode()
              ? Image.asset('assets/images/body_sebha_dark.png')
              : Image.asset('assets/images/body_sebha_logo.png'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Text(
                  AppLocalizations.of(context)!.hadethname,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.height * 0.1,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.018,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: provider.isDarkMode()
                        ? Colors.white10
                        : Color(0xffB7935F),
                  ),
                  child: Text(
                    '$tasbeehCount',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: provider.isDarkMode()
                              ? AppColor.whiteColor
                              : AppColor.blackColor,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ElevatedButton(
                  onPressed: tasbeeh,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: provider.isDarkMode()
                        ? AppColor.yellowColor
                        : AppColor.primaryLight_Color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    tasbeehName,
                    style: TextStyle(
                      fontSize: 24,
                      color: provider.isDarkMode()
                          ? AppColor.blackColor
                          : AppColor.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  void tasbeeh() {
    tasbeehCount++;
    if (tasbeehCount == 33) {
      tasbeehName = 'الحمد لله';
    } else if (tasbeehCount == 66) {
      tasbeehName = 'الله أكبر';
    } else if (tasbeehCount == 99) {
      tasbeehName = 'لا إله إلا الله';
    } else if (tasbeehCount == 100) {
      tasbeehCount = 0; // إعادة التعيين
      tasbeehName = 'سبحان الله';
    }
    setState(() {});
  }
}
