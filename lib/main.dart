import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_times/constants/colors.dart';
import 'package:world_times/database/theme_provider.dart';
import 'package:world_times/services/services.dart';
import 'package:world_times/splash.dart';


void main() {
  SharedPreferences.setMockInitialValues({});
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_)=> ThemeProvider()..initialize() ),
        Provider<WorldTimeServices>(create: (context) => WorldTimeServices())
      ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget  {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context,provider,child) {
        return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: lightbg,
              textTheme: const TextTheme(bodyText2: TextStyle(color: dark)),
              cardColor: lightblue,
              dialogBackgroundColor: white,
              canvasColor: dark,
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: dark,
                textTheme: const TextTheme(bodyText2: TextStyle(color: white),),
              cardColor: dark2,
              dialogBackgroundColor: dark2,
              ),
            themeMode: provider.themeMode,
            debugShowCheckedModeBanner: false,
            title: 'World Times',
            home:const SplashScreen()
        );
      }
    );
  }
}

