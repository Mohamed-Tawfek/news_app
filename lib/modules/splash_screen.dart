import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/layout/home_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../bloc/news_cubit.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
              type: PageTransitionType.leftToRight,
              child: NewsCubit.onBoarding == true
                  ? const HomeScreen()
                  : OnboardingScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lottie_jsons/lottie.json',
          width: 250,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
