import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space_x_rocket_launches/router/router_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigateToHome() async {
    //? 2 seconds delay for splash screen and loading states if any - may come later :D
    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (context.mounted) {
      context.go(RouterName.home);
    }
  }

  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          CircularProgressIndicator(),
          Text('Loadint'),
        ],
      ),
    );
  }
}
