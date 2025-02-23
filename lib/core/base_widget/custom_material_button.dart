import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/change_theme/change_theme_cubit/change_theme_cubit.dart';
import 'package:ecommerce/features/change_theme/change_theme_cubit/change_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomMaterialButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  final bool loading;

  const CustomMaterialButton({
    super.key,
    required this.label,
    required this.onPress,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        var isDarkMode = context.read<ChangeThemeCubit>().isDark;

        return MaterialButton(
          onPressed: loading ? null : onPress, // Disable when loading
          color: isDarkMode ? MyColors.myMutedGold : MyColors.myMutedBlue,
          disabledColor: Colors.grey.shade400,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 15.h),
          minWidth: double.infinity,
          child: loading
              ? SpinKitHourGlass(
                  color: Colors.white,
                  size: 30.r,
                )
              : Text(
                  label,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
        );
      },
    );
  }
}
