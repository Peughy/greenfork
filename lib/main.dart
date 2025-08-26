import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:greenfork/src/constants/app_color.dart';
import 'package:greenfork/src/notifiers/app_notifier.dart';
import 'package:greenfork/src/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<bool?> getMode() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      return preferences.getBool("isDarkMode");
    }

    return FutureBuilder(
      future: getMode(),
      builder: (context, snapshot) {
        bool isDarkMode = snapshot.data ?? false;
        isDarkModeNotifier.value = isDarkMode;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: isDarkMode ? Brightness.dark : Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColor.primary[900]!,
            ),
          ),
          home: LoginScreen(),
        );
      },
    );
  }
}
