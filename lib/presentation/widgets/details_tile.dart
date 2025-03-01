import 'package:african_explorer/core/config/app_color.dart';
import 'package:african_explorer/core/extension/build_context.dart';
import 'package:flutter/material.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    super.key,
    required this.leftTile,
    required this.rightTile,
  });

  final String leftTile;
  final String rightTile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leftTile,
          style: context.textTheme.bodySmall?.copyWith(color: AppColor.grey600),
        ),
        Text(
          rightTile,
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }
}
