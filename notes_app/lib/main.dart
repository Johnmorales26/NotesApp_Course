import 'package:flutter/material.dart';
import 'package:notes_app/common/constants.dart';
import 'package:notes_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff91F48F)),
        useMaterial3: true,
      ),
      initialRoute: homeScreen,
      routes: {
        homeScreen: (_) => HomeScreen(),
        addScreen: (_) => const AddScreen(),
        searchScreen: (_) => const SearchScreen()
      },
    );
  }
}
