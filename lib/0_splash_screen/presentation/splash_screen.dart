import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maliya_mobile/utils/app_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds and then navigate to login screen
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SVG Logo - replace 'assets/logo.svg' with your actual SVG file path
            SvgPicture.asset(
              AppConstant.logoBaniere,
              height: 65,
              width: 65,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(), // Loading indicator
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
