import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: SpaceXLaunches()));
}

class SpaceXLaunches extends StatelessWidget {
  const SpaceXLaunches({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}