import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/settings/logic/setting_cubit/setting_cubit.dart';
import 'package:ecommerce/features/settings/logic/setting_cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AboutTermsWidget extends StatelessWidget {
  const AboutTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        var cubit = SettingCubit.get(context);
        return ExpansionTile(
          textColor: MyColors.myMutedBlue,
          title: const Text(
            "About & Terms",
          ),
          children: [
            ExpansionTile(
              textColor: MyColors.myMutedBlue,
              title: const Text(
                "About:",
              ),
              children: [
                ListTile(
                  title: state is SettingLoadingState
                      ? Center(
                          child: SpinKitHourGlass(
                          color: MyColors.myMutedGold,
                          size: 50.0.r,
                        ))
                      : Text(
                          cubit.settingsModel?.data?.about ?? "no content",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                )
              ],
            ),
            ExpansionTile(
              textColor: MyColors.myMutedBlue,
              title: const Text(
                "Terms:",
              ),
              children: [
                ListTile(
                  title: state is SettingLoadingState
                      ? Center(
                          child: SpinKitHourGlass(
                            color: MyColors.myMutedGold,
                            size: 50.0.r,
                          ),
                        )
                      : Text(
                          cubit.settingsModel?.data?.terms ?? "no content",
                          style: Theme.of(context).textTheme.bodyMedium,
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
