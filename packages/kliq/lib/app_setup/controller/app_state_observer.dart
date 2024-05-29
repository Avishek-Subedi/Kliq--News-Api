import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kliq/app_setup/controller/app_controller.dart';

class AppStateObserver extends ConsumerWidget {
  const AppStateObserver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We can implement dynamic routing as per the app state
    final appState = ref.watch(appController);
    return appState.map(
      started: (_) => const Placeholder(),
      showOnBoarding: (_) => const Placeholder(),
      authenticated: (_) => const Placeholder(),
      unAuthenticated: (_) => const Placeholder(),
    );
  }
}
