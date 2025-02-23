import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/auth/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showProfileIcon;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showProfileIcon = true,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0, // Remove shadow for a cleaner look
      title: Text(
        title,
        style: TextStyle(
          color: MyColors.myMutedGold,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
      ),
      leading: leading,
      actions: actions ??
          (showProfileIcon
              ? [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      CupertinoIcons.person,
                      color: MyColors.myMutedGold,
                    ),
                  ),
                ]
              : []),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
