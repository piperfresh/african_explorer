import 'package:african_explorer/core/common/common.dart';
import 'package:african_explorer/core/config/config.dart';
import 'package:african_explorer/core/extension/extension.dart';
import 'package:african_explorer/data/repository/country_repository.dart';
import 'package:african_explorer/presentation/bloc/country_details/country_details.dart';
import 'package:african_explorer/presentation/widgets/details_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CountryDetailsScreen extends StatefulWidget {
  const CountryDetailsScreen({super.key, required this.countryName});

  final String countryName;

  @override
  State<CountryDetailsScreen> createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    Future.delayed(const Duration(milliseconds: 100), () {
      _animationController.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryDetailsBloc(context.read<CountryRepository>())
        ..add(FetchCountryDetails(widget.countryName)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Details',
            style: context.textTheme.bodyMedium,
          ),
        ),
        body: BlocBuilder<CountryDetailsBloc, CountryDetailsState>(
            builder: (context, state) {
          if (state is CountryDetailsInitial ||
              state is CountryDetailsLoading) {
            return const AppLoader();
          } else if (state is CountryDetailsLoaded) {
            final country = state.countryDetails;
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: Tween<double>(begin: 0.8, end: 1.0)
                                    .animate(CurvedAnimation(
                                        parent: _animationController,
                                        curve: const Interval(0.0, 0.5,
                                            curve: Curves.easeOutBack)))
                                    .value,
                                child: Opacity(
                                  opacity: Tween<double>(begin: 0.0, end: 1.0)
                                      .animate(CurvedAnimation(
                                        parent: _animationController,
                                        curve: const Interval(0.0, 0.5,
                                            curve: Curves.easeOut),
                                      ))
                                      .value,
                                  child: child,
                                ),
                              );
                            },
                            child: Hero(
                              tag: 'flag_${country.name?.common}',
                              child: SizedBox(
                                height: 300.h,
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl: country.flags?.png ?? '',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          if (country.coatOfArms?.png != null)
                            Positioned(
                                bottom: 20.h,
                                left: 170.w,
                                right: 170.w,
                                child: Container(
                                  width: 50.w,
                                  height: 50.h,
                                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: AppColor.white, width: 2.w)),
                                  child: CachedNetworkImage(
                                    imageUrl: country.coatOfArms?.png ?? '',
                                    fit: BoxFit.fill,
                                  ),
                                ))
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(15.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.r),
                            topLeft: Radius.circular(12.r),
                          ),
                          // color: Colors.red,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedBuilder(
                              animation: _animationController,
                              builder: (context, child) {
                                return Transform.translate(
                                  offset: Offset(
                                      0,
                                      20 *
                                          (1 -
                                              Tween<double>(
                                                      begin: 0.0, end: 1.0)
                                                  .animate(CurvedAnimation(
                                                      parent:
                                                          _animationController,
                                                      curve: const Interval(
                                                          0.2, 0.7,
                                                          curve:
                                                              Curves.easeOut)))
                                                  .value)),
                                  child: Opacity(
                                    opacity: Tween<double>(begin: 0.0, end: 1.0)
                                        .animate(CurvedAnimation(
                                          parent: _animationController,
                                          curve: const Interval(0.2, 0.7,
                                              curve: Curves.easeOut),
                                        ))
                                        .value,
                                    child: child,
                                  ),
                                );
                              },
                              child: Text(country.name?.common ?? '',
                                  style: context.textTheme.bodyLarge),
                            ),
                            10.sbH,
                            DetailsTile(
                                leftTile: 'Capital: ',
                                rightTile: country.capital.first),
                            10.sbH,
                            DetailsTile(
                                leftTile: 'Sub region: ',
                                rightTile: country.subregion ?? ''),
                            10.sbH,
                            DetailsTile(
                                leftTile: 'Timezone: ',
                                rightTile: country.timezones.first),
                            10.sbH,
                            DetailsTile(
                              leftTile: 'Car side: ',
                              rightTile: capitalizeFirstLetter(
                                  country.car?.side ?? ''),
                            ),
                            10.sbH,
                            DetailsTile(
                              leftTile: 'Population: ',
                              rightTile:
                                  formatNumber(country.population.toString()),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          } else if (state is CountryDetailsError) {
            return CustomError(
              message: state.message,
              onRetry: () {
                context
                    .read<CountryDetailsBloc>()
                    .add(FetchCountryDetails(widget.countryName));
              },
            );
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }
}
