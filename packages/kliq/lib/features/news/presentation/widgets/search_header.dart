import 'package:flutter/material.dart';
import 'package:kliq_components/kliq_componenets.dart';

class SearchHeader extends StatelessWidget {
  SearchHeader({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: context.primary,
          ),
          hintText: 'Search latest news',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: context.primary)),
        ),
      ),
    );
  }
}
