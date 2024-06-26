import 'package:flutter/material.dart';
import 'package:kliq_components/kliq_componenets.dart';

class ChipWidget extends StatelessWidget {
  ChipWidget({
    super.key,
    required this.chipText,
    this.isSelected = false,
    required this.onTap,
  });

  final String chipText;
  bool isSelected;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: Text(
          chipText,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
