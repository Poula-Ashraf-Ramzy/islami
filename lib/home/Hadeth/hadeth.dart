import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/home/Hadeth/item_HadethName.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      loadHadethFile();
    }

    return Column(
      children: [
        Image.asset('assets/images/quran.png'),
        Divider(
          color: Color(0xffB7935F),
          thickness: 4,
        ),
        Text(
          AppLocalizations.of(context)!.hadethname,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Divider(
          color: Color(0xffB7935F),
          thickness: 4,
        ),
        Expanded(
          child: ahadethList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffB7935F),
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Color(0xffB7935F),
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemHadethName(hadeth: ahadethList[index]);
                  },
                  itemCount: ahadethList.length,
                ),
        ),
      ],
    );
  }

  void loadHadethFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
