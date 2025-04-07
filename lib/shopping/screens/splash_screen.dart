import 'package:dartactivity/shopping/screens/shopping_home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ShoppingHome()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: SizedBox(
        height: 100,
        width: 100,
        child: LottieBuilder.asset(
          'assets/animation/shopping_cart.json',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
