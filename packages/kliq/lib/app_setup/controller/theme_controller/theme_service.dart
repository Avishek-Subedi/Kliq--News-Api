import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

enum ThemeMode { light, dark }

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);

  void toggleLight() {
    state = ThemeMode.light;
  }

  void toggleDark() {
    state = ThemeMode.dark;
  }
}

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return FlutterSwitch(
      height: 32,
      width: 60,
      value: themeMode == ThemeMode.dark,
      onToggle: (value) async {
        // Toggle the theme by calling toggleTheme on the themeProvider notifier
        ref.read(themeProvider.notifier);
      },
      activeColor: Colors.orange,
      inactiveColor: Colors.black,
      inactiveIcon: const Icon(
        Icons.nightlight_rounded,
        color: Colors.white,
      ),
      activeIcon: const Icon(
        Icons.sunny,
        color: Colors.white,
      ),
    );
  }
}
