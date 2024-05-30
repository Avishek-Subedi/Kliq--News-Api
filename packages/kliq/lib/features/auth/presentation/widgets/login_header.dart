// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:kliq_components/kliq_componenets.dart';
import 'package:kliq_resources/kliq_resources.dart';

class LoginHeader extends StatelessWidget {
  final bool isLoginScreen;
  const LoginHeader({
    super.key,
    this.isLoginScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Picture(
          source: Asset.icons.k,
          colorFilter: ColorFilter.mode(
              isLoginScreen
                  ? colorScheme(context).surface
                  : colorScheme(context).onSecondary,
              BlendMode.srcATop),
          height: screenHeight(context) / 15,
        ),
        SizedBox(height: screenHeight(context) / 70),
        Text(
          "Please Fill in your Details",
          style: textTheme(context).bodyMedium?.copyWith(
              color: isLoginScreen
                  ? colorScheme(context).surface
                  : colorScheme(context).onSecondary,
              fontSize: 12),
        ),
      ],
    );
  }
}
