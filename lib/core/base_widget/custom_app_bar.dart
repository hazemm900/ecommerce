import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/helper/change_lang.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/auth/screens/profile_screen.dart';
import 'package:ecommerce/features/change_theme/widget/change_theme_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;

  const CustomAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        appBarTitle,
        style:  TextStyle(
          color: MyColors.myMutedGold,
          fontWeight: FontWeight.bold,
          fontSize: 24.sp,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
            icon: const Icon(
              CupertinoIcons.person,
              color: MyColors.myMutedGold,
            ))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
