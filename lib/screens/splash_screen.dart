import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space_x_rocket_launches/router/router_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) context.go(RouterName.home);
    });
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.blue,
            ),
            Text('Loading'),
          ],
        ),
      ),
    );
  }
}
