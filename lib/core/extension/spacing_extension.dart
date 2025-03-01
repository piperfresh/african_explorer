import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SpacingExtension on num {
  SizedBox get sbH => SizedBox(height: h);

  SizedBox get sbW => SizedBox(width: w);
}
