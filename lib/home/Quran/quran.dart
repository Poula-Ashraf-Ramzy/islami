import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colorApp.dart';
import 'package:flutter_application_1/home/Quran/item_SuraName.dart';
import 'package:flutter_application_1/provider/App_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class QuranTap extends StatelessWidget {
  List<String> SuraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        Image.asset('assets/images/qur2an_screen_logo.png'),
        Divider(
          color: provider.isDarkMode()
              ? AppColor.yellowColor
              : AppColor.primaryLight_Color,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.suraname,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Divider(
          color: provider.isDarkMode()
              ? AppColor.yellowColor
              : AppColor.primaryLight_Color,
          thickness: 3,
        ),
        Expanded(
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
              return ItemSuraname(names: SuraName[index], index: index);
            },
            itemCount: SuraName.length,
          ),
        ),
      ],
    );
  }
}
