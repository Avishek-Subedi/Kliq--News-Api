import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KliqTheme extends StatefulWidget {
  const KliqTheme({required this.builder, required this.themeMode, super.key});

  final Widget Function(KliqThemeConfig) builder;
  final ThemeMode themeMode;

  @override
  State<KliqTheme> createState() => _KliqThemeState();

  static KliqThemeConfig of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<_KliqThemeScope>();
    assert(result != null, 'No KliqTheme found in context');
    return result!.config;
  }
}

class _KliqThemeState extends State<KliqTheme> {
  late final KliqThemeConfig _config;

  @override
  void initState() {
    super.initState();
    _config = KliqThemeConfig(
      mode: widget.themeMode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _KliqThemeScope(config: _config, child: widget.builder(_config));
  }
}

class _KliqThemeScope extends InheritedWidget {
  const _KliqThemeScope({required this.config, required super.child});

  final KliqThemeConfig config;

  @override
  bool updateShouldNotify(_KliqThemeScope oldWidget) =>
      oldWidget.config != config;
}

class KliqThemeConfig {
  KliqThemeConfig({required this.mode}) {
    // var robotoTextTheme = GoogleFonts.robotoTextTheme();
    // const robotoMF = 'Roboto_medium';

    // robotoTextTheme = robotoTextTheme.copyWith(
    //   titleMedium: robotoTextTheme.titleMedium!.copyWith(fontFamily: robotoMF),
    //   titleSmall: robotoTextTheme.titleSmall!.copyWith(fontFamily: robotoMF),
    //   labelLarge: robotoTextTheme.labelLarge!.copyWith(fontFamily: robotoMF),
    //   labelMedium: robotoTextTheme.labelMedium!.copyWith(fontFamily: robotoMF),
    //   labelSmall: robotoTextTheme.labelSmall!.copyWith(fontFamily: robotoMF),
    // );

    //for text theme
    final customTextTheme = TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 72,
        // color: Color.fromARGB(255, 255, 248, 248),
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 50,
        // color: const Color.fromARGB(255, 0, 0, 0),
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 40,
        // color: const Color.fromARGB(255, 0, 0, 0),
      ),
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        // color: const Color.fromARGB(255, 0, 0, 0),
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 22,
        // color: const Color.fromARGB(255, 0, 0, 0),
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 20,
        // color: const Color.fromARGB(255, 0, 0, 0),
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 18,
        // color: Color(0xff134266),
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 16,
        // color: Color(0xFF1B5D90),
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 14,
        // color: Color(0xff134266),
      ),
      bodyLarge: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold
          // color: const Color.fromARGB(255, 0, 0, 0),
          ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 8,
        // color: Colors.blue,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 24,
        // color: Color(0xFF606060),
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 14,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 16,
      ),
      labelLarge: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
    );

    light = ThemeData(
      colorScheme: _lightColorScheme,
      useMaterial3: true,
      textTheme: customTextTheme,
    ).copyWith(
      dividerColor: Colors.transparent,
      tabBarTheme: TabBarTheme(
        dividerColor: Colors.transparent,
        indicator: const BoxDecoration(color: Colors.transparent),
        labelColor: _lightColorScheme.tertiary,
        unselectedLabelColor: _lightColorScheme.shadow,
      ),
    );

    dark = ThemeData(
        colorScheme: _darkColorScheme,
        useMaterial3: true,
        textTheme: customTextTheme);
  }

  final ThemeMode mode;

  late final ThemeData light;
  late final ThemeData dark;
  late final ThemeData grey;
}

ColorScheme _lightColorScheme = ColorScheme.light(
  primary: Color(0xff004CB5),
  secondary: Color(0xffFF9800),
  tertiary: Color(0xff4CAF50),
  error: Color(0xffB42318),
  // On Colors
  onPrimary: Color(0XFFFFFFFF),

  onSecondary: Color(0xff331F00),
  onTertiary: Color(0XFFFFFFFF),
  onError: Color(0xffffffff),
  // Container Colors
  primaryContainer: Color(0XFF9dbbe6),
  secondaryContainer: Color(0xffE6C89D),
  tertiaryContainer: Color(0xffbce6be),
  errorContainer: Color(0xffE4E7EC),

  // On Container Colors
  onPrimaryContainer: Color(0xf001533),
  //Selected container
  onSecondaryContainer: Color(0XFF331f00),
  //UnselectedContainer
  onTertiaryContainer: Color(0xff163317),
  onErrorContainer: Color(0xff7A271A),
  // Neutral Colors
  surface: Color(0xffF6F8FA),
  surfaceTint: Color(0xffDCE8F5),
  onSurface: Color.fromARGB(255, 228, 232, 234),
  onSurfaceVariant: Color(0xff757B80),
  surfaceContainerHighest: Color(0xffdce4e8),
  outline: Color(0xff9EA3A6),
  outlineVariant: Colors.white,
  // Inverse & Shadow Colors
  inverseSurface: Color(0xff2E3032),
  onInverseSurface: Color(0xffE0EAF6),
  inversePrimary: Color(0xff5FD4FD),
  scrim: Colors.white,
  shadow: Color.fromARGB(255, 226, 224, 224),
);

const ColorScheme _darkColorScheme = ColorScheme.dark(
  primary: Color(0xff004cb5),
  secondary: Color(0xffff9800),
  tertiary: Color(0xff4caf50),
  error: Color(0xffd92d20),
  // On Colors
  onPrimary: Color(0xff00204c),
  onError: Color(0xff912018),
  onSecondary: Color.fromARGB(188, 43, 41, 41),
  onTertiary: Color(0xff214c23),
  // Container Colors
  primaryContainer: Color(0xff002b66),
  secondaryContainer: Color(0xff663d00),
  tertiaryContainer: Color(0xff2c662f),
  errorContainer: Color(0xffB42318),
  // On Container Colors
  onPrimaryContainer: Color(0xff9dbbe6),
  //Selected container
  onSecondaryContainer: Color(0xffE6C89D),
  //UnselectedContainer
  onTertiaryContainer: Color(0xffbce6be),
  onErrorContainer: Color(0xffFEE4E2),
  // Neutral Colors
  surface: Color(0xffE3EDF7),
  surfaceTint: Color(0xffDCE8F5),
  onSurface: Color(0xff191C1D),
  onSurfaceVariant: Color(0xff757B80),
  surfaceContainerHighest: Color(0xffdce4e8),
  outline: Color(0xff9EA3A6),
  outlineVariant: Colors.white,
  // Inverse & Shadow Colors
  inverseSurface: Color(0xff2E3032),
  onInverseSurface: Color(0xffE0EAF6),
  inversePrimary: Color(0xff5FD4FD),
  scrim: Colors.black,
  shadow: Colors.black,
);

// https://github.com/flutter/flutter/issues/115912
extension SurfaceToneColorSchemeExtension on ColorScheme {
  Color get surfaceDim => const Color(0xffD0D8DF);

  Color get surfaceBright => const Color(0xffE3EDF7);

  Color get surfaceContainerLowest => const Color(0xffEBF5FF);

  Color get surfaceContainerLow => const Color(0xffE0EBF6);

  Color get surfaceContainer => const Color(0xffDCE8F5);

  Color get surfaceContainerHigh => const Color(0xffD8E5F3);

  Color get surfaceContainerHighest => const Color(0xffD0E0F1);
}
