import 'package:flutter/material.dart';
import 'package:kliq_components/kliq_componenets.dart';

class SocialContainer extends StatelessWidget {
  final String source;
  final double? height;
  final bool isLoading;
  const SocialContainer({
    super.key,
    required this.source,
    this.height = 40,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.55))
            ]),
        child: isLoading
            ? Padding(
                padding: const EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      colorScheme(context).surface),
                ),
              )
            : Center(
                child: Picture(
                source: source,
                height: 18,
              )));
  }
}
