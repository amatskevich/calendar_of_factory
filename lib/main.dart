import 'package:calendaroffactory/configuration_main_screen/configuration_main_screen.dart';
import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'about_screen/about_screen.dart';
import 'calendar_screen/calendar_screen.dart';
import 'configuration_screen/configuration_screen.dart';
import 'edit_shift_screen/edit_shift_screen.dart';
import 'main_screen/main_screen.dart';
import 'persistent/database_service.dart';
import 'providers/timetables.dart';
import 'providers/user_settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseService();
  var userTheme = await UserSettings.retrieveThemeFromPreferences();
  runApp(MyApp(userTheme));
}

class MyApp extends StatelessWidget {
  final String initialUserTheme;

  MyApp(this.initialUserTheme);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SelectedDate()),
        ChangeNotifierProvider.value(value: Timetables()),
        ChangeNotifierProvider.value(value: UserSettings(initialUserTheme)),
      ],
      builder: (ctx, _) {
        return MaterialApp(
          title: 'Смены Полимира',
          initialRoute: '/',
          theme: Provider.of<UserSettings>(ctx, listen: true).getUserTheme(),
          routes: {
            '/': (context) => MainScreen(),
            CalendarScreen.routeName: (_) => CalendarScreen(),
            ConfigurationMainScreen.routeName: (_) => ConfigurationMainScreen(),
            ConfigurationScreen.routeName: (_) => ConfigurationScreen(),
            AboutScreen.routeName: (_) => AboutScreen(),
            EditShiftScreen.routeName: (_) => EditShiftScreen(),
          },
        );
      },
    );
  }
}
