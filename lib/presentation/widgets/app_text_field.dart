import 'package:african_explorer/core/config/app_color.dart';
import 'package:african_explorer/core/extension/asset.dart';
import 'package:african_explorer/core/extension/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onTap,
  });

  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      style: context.textTheme.bodySmall,
      onChanged: onChanged,
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
            child: SvgPicture.asset('search'.svg),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 20.w,
            minHeight: 20.w,
          ),
          hintText: 'Search for a country',
          hintStyle: context.textTheme.bodySmall?.copyWith(
            color: AppColor.grey400,
          ),
          filled: true,
          fillColor: AppColor.grey200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          )),
    );
  }
}
