import 'package:african_explorer/core/extension/build_context.dart';
import 'package:african_explorer/core/extension/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomError extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const CustomError({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(Icons.error_outline,
                size: 64.h, color: Theme.of(context).colorScheme.error),
            12.sbH,
            Text('Oops! Something went wrong',
                style: context.textTheme.bodyMedium),
            8.sbH,
            Text(message, style: context.textTheme.bodyMedium),
            if (onRetry != null) ...[
              8.sbH,
              ElevatedButton(onPressed: onRetry, child: const Text('Try Again'))
            ]
          ],
        ),
      ),
    );
  }
}
