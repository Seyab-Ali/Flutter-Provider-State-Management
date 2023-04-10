import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/provider/auth_provider.dart';
import 'package:flutter_provider_state_management/provider/count_provider.dart';
import 'package:flutter_provider_state_management/provider/example_one_provider.dart';
import 'package:flutter_provider_state_management/provider/favorite_provider.dart';
import 'package:flutter_provider_state_management/provider/theme_changer.dart';
import 'package:flutter_provider_state_management/screen/dark_theme_screen.dart';
import 'package:flutter_provider_state_management/screen/login_screen.dart';
import 'package:flutter_provider_state_management/screen/value_notify_listner.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),

      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.blue,
              ),
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primaryColor: Colors.yellow,
                  primarySwatch: Colors.purple,
                  appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
                  iconTheme: const IconThemeData(
                    color: Colors.pink,
                  )),
              home:  const DarkThemeScreen());
        },
      ),
    );
  }
}
