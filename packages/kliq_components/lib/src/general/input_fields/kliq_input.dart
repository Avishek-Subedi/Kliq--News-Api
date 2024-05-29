import 'package:flutter/material.dart';
import 'package:kliq_components/kliq_componenets.dart';

class KliqTextField extends StatefulWidget {
  final TextEditingController controller;

  final bool isPassword;
  final VoidCallback? onPressed;

  final FormFieldValidator<String>? validator;
  const KliqTextField({
    super.key,
    required this.controller,
    this.isPassword = false,
    this.onPressed,
    this.validator,
  });

  @override
  State<KliqTextField> createState() => _KliqTextFieldState();
}

class _KliqTextFieldState extends State<KliqTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textTheme(context).bodySmall!.copyWith(),
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? true : false,
      onTap: widget.onPressed,
      decoration: InputDecoration(
          isDense: true,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
            ),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
            ),
          ),
          errorStyle: textTheme(context).bodyMedium?.copyWith(fontSize: 8)),
    );
  }
}