import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_state_management_task/providers/course_provider.dart';
import 'package:ui_state_management_task/views/search_screen.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CourseProvider()..loadCourses()),
        ],
      child: const MyApp(),
    )
      // const MyApp()

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SearchScreen(),
    );
  }
}

