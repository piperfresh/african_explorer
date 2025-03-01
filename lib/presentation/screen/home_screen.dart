import 'package:african_explorer/core/common/common.dart';
import 'package:african_explorer/core/config/config.dart';
import 'package:african_explorer/core/extension/extension.dart';
import 'package:african_explorer/presentation/bloc/countries/countries.dart';
import 'package:african_explorer/presentation/screen/country_details_screen.dart';
import 'package:african_explorer/presentation/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.white,
        leadingWidth: 50.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: SvgPicture.asset('category'.svg),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: SvgPicture.asset('notification'.svg),
          ),
        ],
        title: Text(
          'African Explorer',
          style: context.textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          children: [
            AppTextField(
              controller: _searchController,
              onTap: () {
                _searchController.clear();
                context.read<CountriesBloc>().add(const SearchCountries(''));
              },
              onChanged: (name) {
                context.read<CountriesBloc>().add(SearchCountries(name));
              },
            ),
            10.sbH,
            Expanded(child: BlocBuilder<CountriesBloc, CountriesState>(
                builder: (context, state) {
              if (state is CountriesInitial || state is CountriesLoading) {
                return const AppLoader();
              } else if (state is CountriesLoaded) {
                final filterCountries = state.filterCountries;
                if (state.filterCountries.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        Icon(Icons.search_off, size: 64.h),
                        16.sbH,
                        Text(
                          'No countries found for ${_searchController.text}',
                          style: context.textTheme.bodyMedium,
                        )
                      ],
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<CountriesBloc>().add(FetchCountries());
                  },
                  child: ListView.separated(
                    itemCount: filterCountries.length,
                    itemBuilder: (context, index) {
                      return CountryCard(
                        countryModel: filterCountries[index],
                        onTap: () {
                          context.push(MaterialPageRoute(
                              builder: (context) => CountryDetailsScreen(
                                  countryName:
                                      filterCountries[index].name!.common ??
                                          '')));
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return 12.sbH;
                    },
                  ),
                );
              } else if (state is CountriesError) {
                return CustomError(
                  message: state.message,
                  onRetry: () async {
                    context.read<CountriesBloc>().add(FetchCountries());
                  },
                );
              } else {
                return const Center(child: Text('Unknown state'));
              }
            }))
          ],
        ),
      ),
    );
  }
}
