import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/settings/logic/setting_cubit/setting_cubit.dart';
import 'package:ecommerce/features/settings/logic/setting_cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AboutTermsWidget extends StatelessWidget {
  const AboutTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
    builder: (context, state) {
      var cubit = SettingCubit.get(context);
      return ExpansionTile(
        title: Text(
          "About & Terms",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        children: [
          ExpansionTile(
            title: Text(
              "About:",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            children: [
              ListTile(
                title: state is SettingLoadingState
                    ? const Center(
                  child: SpinKitHourGlass(
                    color: MyColors.myMutedGold,
                    size: 50.0,
                  )
                )
                    : Text(
                  cubit.settingsModel?.data?.about ??
                      "no content",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium,
                ),
              )
            ],
          ),
          ExpansionTile(
            title: Text(
              "Terms:",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            children: [
              ListTile(
                title: state is SettingLoadingState
                    ? const Center(
                  child: SpinKitHourGlass(
                    color: MyColors.myMutedGold,
                    size: 50.0,
                  ),
                )
                    : Text(
                  cubit.settingsModel?.data?.terms ??
                      "no content",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium,
                ),
              )
            ],
          ),
        ],
      );
    },
);

  }
}
