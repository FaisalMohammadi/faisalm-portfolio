import 'package:faisalm_portfolio/common/themes/app_theme.dart';
import 'package:faisalm_portfolio/provider/drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/di/di.dart';
import 'common/helper/print.dart';
import 'common/preferences/preferences.dart';
import 'main_app.dart';
import 'provider/app_provider.dart';
import 'provider/scroll_provider.dart';
import 'ui/main/main_page.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    //HttpOverrides.global = MyHttpOverrides(); // for handshake certification error

    /// gets the AuthProvider class instance
    //AuthProvider authProvider = locator.get<AuthProvider>();
    await initDependencies();

    /// initializes the shared preferences
    await Preferences.initialize();

    /// restores all the authentication state from sharedpreferences
    /* await locator.get<AuthService>().tryRestoreAuthStateFromPreferencesAsync();

    /// check and Authenticate with Biometrics
    await locator.get<BiometricLoginService>().checkAndAuthenticateWithBiometrics();
    await locator.get<AuthService>().tryAutoLogin(); */
    
    runApp(
      MyApp(),
    );
  } catch (e) {
    printError('Main.main() => Unhandled Exception', e);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => ScrollProvider()),
      ],
      child: Consumer<AppProvider>(
        builder: (context, value, _) => MainApp(
          provider: value,
        ),
      ),
    );
  }
}
