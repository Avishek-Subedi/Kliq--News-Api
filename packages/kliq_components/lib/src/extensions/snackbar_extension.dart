import 'package:flutter/material.dart';
import 'package:kliq_components/kliq_componenets.dart';

extension SnackbarExtension on BuildContext {
  void showSnackBar(
      {required String message, bool isError = true, bool showIcon = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 15,
        margin: EdgeInsets.symmetric(horizontal: this.width * .05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showIcon
                ? Icon(
                    isError
                        ? Icons.error_outline_rounded
                        : Icons.check_circle_outline_rounded,
                    color: Colors.white,
                  )
                : const SizedBox(),
            Flexible(
              child: Text(
                message,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(this).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 15,
                    ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
