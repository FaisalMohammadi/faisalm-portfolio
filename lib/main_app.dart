import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'common/themes/core_theme.dart' as appTheme;

import 'provider/app_provider.dart';
import 'ui/main/main_page.dart';

class MainApp extends StatefulWidget {
  final AppProvider provider;
  const MainApp({Key? key, required this.provider}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void initAppTheme() {
    final appProviders = AppProvider.state(context);
    appProviders.init();
  }

  @override
  void initState() {
    initAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Faisal',
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: widget.provider.themeMode,
      initialRoute: "/",
      routes: {
        "/": (context) => const MainPage(),
      },
    );
  }
}
