import 'package:ecommerce/core/helper/sheared_preference.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarOnboardingWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final int currentIndex;
  final int lengthList;

  const AppBarOnboardingWidget(
      {super.key, required this.currentIndex, required this.lengthList});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 0.0,
      elevation: 0.0,
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(
        "${currentIndex + 1}/$lengthList",
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.black),
      ),
      actions: [
        TextButton(
            onPressed: () {
              CacheHelper.saveData(key: "onboarding", value: true);
              Navigator.pushReplacementNamed(context, Routes.loginScreen);
            },
            child: const Text("SKIP"))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
