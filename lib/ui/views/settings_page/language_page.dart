
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../core/localization/localization_manager.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localeManager = Provider.of<LocaleManager>(context);
    return Scaffold(
      backgroundColor: AColors.white,
      appBar: AppBar(
          backgroundColor: AColors.mainGrey,
          elevation: 0,
          title: Text(
            localeManager.translate("languageSettings"),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18 ,
              fontWeight: FontWeight.w400,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              localeManager.translate("selectLanguage"),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AColors.secondaryOrange,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: DropdownButton<Locale>(
                  value: localeManager.currentLocale,
                  isExpanded: true,
                  underline: const SizedBox(), // Alt çizgiyi kaldırır
                  borderRadius: BorderRadius.circular(8),
                  onChanged: (Locale? newLocale) {
                    if (newLocale != null) {
                      localeManager.changeLocale(newLocale);
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: Locale("en"),
                      child: Text("English"),
                    ),
                    DropdownMenuItem(
                      value: Locale("tr"),
                      child: Text("Turkish"),
                    ),
                    DropdownMenuItem(
                      value: Locale("de"),
                      child: Text("German"),
                    ),
                    DropdownMenuItem(
                      value: Locale("es"),
                      child: Text("Spanish"),
                    ),
                    DropdownMenuItem(
                      value: Locale("ja"),
                      child: Text("Japanese"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                localeManager.translate("selectLanguageMassage"),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
