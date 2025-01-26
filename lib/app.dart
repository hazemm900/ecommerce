import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/helper/sheared_preference.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/theme.dart';
import 'package:ecommerce/features/auth/screens/register_screen.dart';
import 'package:ecommerce/features/change_theme/change_theme_cubit/change_theme_cubit.dart';
import 'package:ecommerce/features/change_theme/change_theme_cubit/change_theme_state.dart';
import 'package:ecommerce/features/custom_bottom_nav_bar/screens/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeThemeCubit(),
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          var cubit = ChangeThemeCubit.get(context);
          return MaterialApp(
            title: 'EcommerceApp',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            // home: const RegisterScreen()
            initialRoute: CacheHelper.getData(key: "token") == null
                ? Routes.registerScreen
                : Routes.customBottomNavBarScreen,
            onGenerateRoute: RouteGenerator.getRoute,
          );
        },
      ),
    );
  }
}
