import 'package:african_explorer/core/config/themes.dart';
import 'package:african_explorer/data/repository/country_repository.dart';
import 'package:african_explorer/data/services/api_service.dart';
import 'package:african_explorer/presentation/bloc/countries/countries_bloc.dart';
import 'package:african_explorer/presentation/bloc/countries/countries_event.dart';
import 'package:african_explorer/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AfricanExploreApp extends StatelessWidget {
  const AfricanExploreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => CountryApiService()),
        RepositoryProvider(
          create: (context) => CountryRepository(context.read<CountryApiService>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CountriesBloc(
                countryRepository: context.read<CountryRepository>())
              ..add(FetchCountries()),
          ),
          // BlocProvider(create: (context) => CountryDetailsBloc(context.read<CountryRepository>())..add(FetchCountryDetails(countryName)),)
        ],
        child: ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          rebuildFactor: (old, data) => true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'African Explorer',
              theme: AppTheme.lightTheme,
              home: const HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}
