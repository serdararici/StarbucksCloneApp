import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:starbucks_clone_app/core/theme/theme_manager.dart';
import 'package:starbucks_clone_app/ui/views/home_page/homePage.dart';
import 'package:starbucks_clone_app/ui/views/mainScreen.dart';

import 'core/localization/localization_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeManager()),
      ChangeNotifierProvider(create: (_) => LocaleManager()),
    ],

    child: Consumer2<ThemeManager, LocaleManager>(
      builder: (context, themeManager,localeManager, child) {
        return MaterialApp(
          title: 'Starbucks Clone',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeManager.themeMode,
          locale: localeManager.currentLocale,
          localizationsDelegates: const[
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const[
            Locale('en'),
            Locale('tr'),
            Locale('de'),
            Locale('es'),
            Locale('ja'),
          ],
          home: MainScreen(),
        );
      }
    )
    );
  }
}

