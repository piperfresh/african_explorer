import 'package:african_explorer/core/config/app_color.dart';
import 'package:african_explorer/core/extension/build_context.dart';
import 'package:african_explorer/core/extension/spacing_extension.dart';
import 'package:african_explorer/data/models/country_model.dart';
import 'package:african_explorer/presentation/widgets/details_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryCard extends StatefulWidget {
  const CountryCard({
    super.key,
    required this.countryModel,
    this.onTap,
  });

  final CountryModel countryModel;
  final void Function()? onTap;

  @override
  State<CountryCard> createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          _controller.forward().then((value) => _controller.reverse());
          widget.onTap!();
        },
        child: Container(
          height: 96.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
            color: AppColor.white200,
          ),
          child: Row(
            children: [
              Hero(
                tag: 'flag-${widget.countryModel.name?.common}',
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      bottomLeft: Radius.circular(12.r)),
                  child: SizedBox(
                    width: 137.w,
                    child: CachedNetworkImage(
                      imageUrl: widget.countryModel.flags?.png ?? '',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              15.sbW,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.countryModel.name?.common ?? '',
                      style: context.textTheme.bodyMedium,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    DetailsTile(
                        leftTile: 'Capital: ',
                        rightTile: widget.countryModel.capital.first),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
