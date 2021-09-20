import 'package:calendaroffactory/add_shifts_screen/add_shifts_screen.dart';
import 'package:calendaroffactory/providers/selected_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
  var carousel = await UserSettings.retrieveCarouselFromPreferences();
  runApp(MyApp(userTheme, carousel));
}

class MyApp extends StatelessWidget {
  final String initialUserTheme;
  final String initialTimetableCarousel;

  MyApp(this.initialUserTheme, this.initialTimetableCarousel);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SelectedDate()),
        ChangeNotifierProvider.value(value: Timetables()),
        ChangeNotifierProvider.value(value: UserSettings(initialUserTheme, initialTimetableCarousel)),
      ],
      builder: (ctx, _) {
        return MaterialApp(
          title: 'Смены Полимира',
          initialRoute: '/',
          theme: Provider.of<UserSettings>(ctx, listen: true).getUserTheme(),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('ru', '')],
          routes: {
            '/': (context) => MainScreen(),
            CalendarScreen.routeName: (_) => CalendarScreen(),
            AddShiftsScreen.routeName: (_) => AddShiftsScreen(),
            ConfigurationScreen.routeName: (_) => ConfigurationScreen(),
            AboutScreen.routeName: (_) => AboutScreen(),
            EditShiftScreen.routeName: (_) => EditShiftScreen(),
          },
        );
      },
    );
  }
}
