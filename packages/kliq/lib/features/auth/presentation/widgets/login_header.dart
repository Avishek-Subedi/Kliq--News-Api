import 'package:flutter/material.dart';
import 'package:kliq_components/kliq_componenets.dart';
import 'package:kliq_resources/kliq_resources.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Picture(
          source: Asset.icons.k,
          colorFilter: const ColorFilter.mode(
              Color.fromARGB(255, 212, 205, 205), BlendMode.srcATop),
          height: screenHeight(context) / 15,
        ),
        SizedBox(height: screenHeight(context) / 70),
        Text(
          "Please Fill in your Details",
          style: textTheme(context)
              .bodyMedium
              ?.copyWith(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
