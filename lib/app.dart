import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: Colors.green,
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border: _getZeroBorder(),
            enabledBorder: _getZeroBorder(),
            errorBorder: _getZeroBorder(),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(double.maxFinite),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          )),
      home: const SplashScreen(),
    );
  }

  OutlineInputBorder _getZeroBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide.none,
    );
  }
}
