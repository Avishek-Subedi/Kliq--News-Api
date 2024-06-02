import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq/app_setup/controller/theme_notifier.dart';
import 'package:kliq/config/route/router.dart';
import 'package:kliq/core/providers/locale_provider.dart';
import 'package:kliq_resources/kliq_resources.dart';

class KliqApp extends ConsumerWidget {
  const KliqApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedString = ref.watch(languageProvider);

    final isDarkTheme = ref.watch(themeProvider).isDark;

    const localization = KliqLocalization();

    return KliqTheme(
        themeMode:
            ref.watch(themeProvider).isDark ? ThemeMode.dark : ThemeMode.light,
        builder: (config) {
          return MaterialApp.router(
            localizationsDelegates: localization.delegates,
            supportedLocales: localization.supportedLocales,
            locale: Locale(selectedString),
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: isDarkTheme ? config.dark : config.light,
            darkTheme: isDarkTheme ? config.dark : config.light,
          );
        });
  }
}
