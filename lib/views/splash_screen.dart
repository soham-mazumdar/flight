import 'package:flutter/material.dart';
import 'package:flight/theme/app_colors.dart';
import 'package:flight/theme/app_text_style.dart';
import 'package:flight/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacementNamed(AppRoutes.flights);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(),
          Text(
            ': Maddy :',
            style: AppTextStyle.xAndO,
          ),
          Text(
            ': Flights :',
            style: AppTextStyle.xAndO,
          ),
        ],
      ),
    );
  }
}
