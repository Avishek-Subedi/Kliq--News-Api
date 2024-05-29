import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kliq_resources/kliq_resources.dart';

final languageProvider = StateProvider<String>(
    (ref) => const kliqLocalization().supportedLocales.first.languageCode);

final supportedLocalesProvider =
    Provider<List<Locale>>((_) => const kliqLocalization().supportedLocales);
