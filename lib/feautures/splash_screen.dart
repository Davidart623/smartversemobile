import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashColors {
  static const backgroundBase = Color(0xFF0E1A34);
  static const backgroundGlow = Color(0xFF1E2E58);
  static const tagline = Color(0xFF7BAADF);
}

class SplashScreen extends StatefulWidget {
  final VoidCallback onOnboardingFinish;

  const SplashScreen({super.key, required this.onOnboardingFinish});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => OnboardingScreen(onFinish: widget.onOnboardingFinish),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.4),
            radius: 1.1,
            colors: [
              SplashColors.backgroundGlow,
              SplashColors.backgroundBase,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 4),
              const SizedBox(height: 120, width: 120),
              const Spacer(flex: 1),
              const Text(
                'Smartvert',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 46,
                  fontWeight: FontWeight.w700,
                  height: 52 / 46,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'Know your solar. Right size, first time.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    height: 19.5 / 13,
                    letterSpacing: 0.6,
                    color: SplashColors.tagline,
                  ),
                ),
              ),
              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}