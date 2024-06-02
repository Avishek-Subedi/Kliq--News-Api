import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kliq_components/kliq_componenets.dart';

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlutterSwitch(
      height: 32,
      width: screenWidth(context) / 7,
      value: true,
      onToggle: (value) async {},
      activeColor: Colors.orange,
      inactiveColor: Colors.black,
      inactiveIcon: const Icon(
        size: 24,
        Icons.nightlight_rounded,
      ),
      activeIcon: const Icon(
        size: 24,
        Icons.sunny,
        color: Colors.amber,
      ),
    );
  }
}
