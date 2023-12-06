import 'package:flight/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flight/views/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      onGenerateRoute: AppRouter().onGenerateRoute,
      home: const SplashScreen(),
    );
  }
}
