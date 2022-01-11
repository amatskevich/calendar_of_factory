# calendaroffactory

Calendar of Polimir 2

It provides a view shift schedule for <a href="http://www.polymir.by/en">the plant "Polymir"</a> (Open Join Stock Company "NAFTAN").

Kinds of schedule:
- 4 shifts of twelve hours;
- 5 shifts of eight hours;
- 2 shifts of twelve hours.

## TODO write valuable README file 

#Build signing APK
1. Enter `cd [project]`
2. Run `flutter build apk`
    (The flutter build command defaults to --release.)
3. `build/app/outputs/apk/release/app-release.apk`

#Build signing app bundle
1. Enter `cd [project]`
2. Run `flutter build appbundle`
    (The flutter build command defaults to --release.)
3. `build/app/outputs/bundle/release/app-release.aab`

#Issue with Flutter
Error: `Cannot open file, path = './pubspec.lock' (OS Error: Permission denied, errno = 13)`
Solution: `sudo chown -R $USER /opt/flutter`