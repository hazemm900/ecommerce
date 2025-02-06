import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/change_theme/change_theme_cubit/change_theme_cubit.dart';
import 'package:ecommerce/features/change_theme/change_theme_cubit/change_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  final bool loading;

  const CustomElevatedButton(
      {super.key,
      required this.label,
      required this.onPress,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        var cubit = ChangeThemeCubit.get(context);
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize:  Size(double.infinity, 50.w),
              backgroundColor:
                  cubit.isDark ? MyColors.myMutedGold : MyColors.myMutedBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: onPress,
            child: loading
                ?  Center(
                    child: SpinKitHourGlass(
                      color: MyColors.myMutedGold,
                      size: 50.0.r,
                    ))
                : Text(
                    label,
                    style:  TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ));
      },
    );
  }
}
