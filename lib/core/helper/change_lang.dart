import 'package:ecommerce/core/helper/sheared_preference.dart';
import 'package:ecommerce/core/networking/dio_factory.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangeLang extends StatelessWidget {
  const ChangeLang({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        String newLang = context.locale.toString() == "en" ? "ar" : "en";

        await CacheHelper.saveData(key: "lang", value: newLang);
        await context.setLocale(Locale(newLang));

        await DioFactory.addDioHeaders(); // Update API headers with the new language

        Phoenix.rebirth(context); // Restart the app to reflect language change
      },
      title: const Text("Change Lang"),
      trailing: const Icon(
        Icons.language_outlined,
        color: MyColors.myMutedGold,
      ),
    );
  }
}
