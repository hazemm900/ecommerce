import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/helper/sheared_preference.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/theme.dart';
import 'package:ecommerce/features/change_theme/change_theme_cubit/change_theme_cubit.dart';
import 'package:ecommerce/features/change_theme/change_theme_cubit/change_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChangeThemeCubit()..loadTheme(), // Ensure theme loads on startup
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          var cubit = context.read<
              ChangeThemeCubit>(); // Using context.read for better performance

          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                title: 'EcommerceApp',
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
                initialRoute: _getInitialRoute(),
                onGenerateRoute: RouteGenerator.getRoute,
              );
            },
          );
        },
      ),
    );
  }

  /// Determines the initial route based on onboarding and authentication state
  String _getInitialRoute() {
    bool isOnboardingDone = CacheHelper.getData(key: "onboarding") ?? false;
    bool hasToken = CacheHelper.getData(key: "token") != null;

    if (!isOnboardingDone) return Routes.onBoardingScreen;
    return hasToken ? Routes.customBottomNavBarScreen : Routes.registerScreen;
  }
}
