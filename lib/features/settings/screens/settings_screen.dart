import 'package:ecommerce/core/base_widget/custom_app_bar.dart';
import 'package:ecommerce/core/helper/change_lang.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/features/change_theme/widget/change_theme_widget.dart';
import 'package:ecommerce/features/faqs/screens/faqs_screen.dart';
import 'package:ecommerce/features/settings/logic/setting_cubit/setting_cubit.dart';
import 'package:ecommerce/features/settings/logic/setting_cubit/setting_state.dart';
import 'package:ecommerce/features/settings/widgets/about_terms_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(getIt())..getSettings(),
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          var cubit = SettingCubit.get(context);
          return Scaffold(
              appBar: const CustomAppBar(title: "settings"),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: const Text("All address"),
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(Routes.allAddressesScreen);
                          },
                        ),
                        const ChangeLang(),
                        const ChangeThemeWidget(),
                        const FaqsScreen(),
                        const AboutTermsWidget(),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
