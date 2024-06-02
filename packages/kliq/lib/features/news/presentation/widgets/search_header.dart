import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kliq/app_setup/controller/theme_controller/theme_service.dart';
import 'package:kliq/app_setup/controller/theme_notifier.dart';
import 'package:kliq/features/news/presentation/search_screen.dart';
import 'package:kliq_components/kliq_componenets.dart';

class SearchHeader extends ConsumerStatefulWidget {
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
  ConsumerState<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends ConsumerState<SearchHeader> {
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: screenWidth(context) - 100,
          child: TextField(
            readOnly: widget.isHomePage,
            onChanged: widget.onChanged,
            controller: widget.controller ?? TextEditingController(),
            style: textTheme(context)
                .bodyMedium
                ?.copyWith(color: colorScheme(context).secondary, fontSize: 14),
            onTap: () {
              SystemChannels.textInput.invokeMethod('TextInput.hide');

              widget.isHomePage
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
        ),
        const Spacer(),
        const ThemeSwitch()
      ],
    );
  }
}
