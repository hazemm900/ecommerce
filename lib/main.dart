import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'core/helper/bloc_observer.dart';
import 'core/helper/sheared_preference.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await setupGetIt();
  // CacheHelper.removeData(key: "token");

  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: Phoenix(
        child: DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => const MyApp(), // Wrap your app
        ),
      )));
}
