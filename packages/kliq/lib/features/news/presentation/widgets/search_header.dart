import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kliq/features/news/presentation/search_screen.dart';
import 'package:kliq_components/kliq_componenets.dart';

class SearchHeader extends StatelessWidget {
  SearchHeader({
    super.key,
    this.isHomePage = true,
    this.onChanged,
    this.controller,
  });
  bool isHomePage;
  TextEditingController? controller;
  Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      child: TextField(
        readOnly: isHomePage,
        onChanged: onChanged,
        controller: controller ?? TextEditingController(),
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');

          isHomePage
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                )
              : null;
        },
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: context.primary,
          ),
          hintText: 'Search latest news',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.primary,
            ),
          ),
        ),
      ),
    );
  }
}
