import 'package:ecommerce/core/helper/sheared_preference.dart';
import 'package:ecommerce/core/networking/dio_factory.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangeLang extends StatelessWidget {
  const ChangeLang({super.key});

  Future<void> _changeLanguage(BuildContext context) async {
    String currentLang = context.locale.languageCode;
    String newLang = currentLang == "en" ? "ar" : "en";

    await CacheHelper.saveData(key: "lang", value: newLang);
    await context.setLocale(Locale(newLang));
    await DioFactory.updateLanguageHeader(newLang);

    // Show a SnackBar message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(newLang == "ar"
            ? "تم تغيير اللغة إلى العربية"
            : "Language changed to English"),
        duration: const Duration(seconds: 2),
        backgroundColor: MyColors.myMutedGold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _changeLanguage(context),
      title: Text(
        tr("change_language"), // Uses translation keys for better localization support
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(
        Icons.language_outlined,
        color: MyColors.myMutedGold,
      ),
    );
  }
}
