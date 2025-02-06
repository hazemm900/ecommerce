import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/auth/screens/login_screen.dart';
import 'package:ecommerce/features/auth/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 40.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome!", style: Theme.of(context).textTheme.bodyLarge),
              verticalSpace(5.h),
              Text("Sign up or Login to your Account",
                  style: Theme.of(context).textTheme.bodyMedium),
              verticalSpace(30.h),
              Container(
                decoration: BoxDecoration(
                  color: MyColors.myMutedBlue,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: MyColors.myMutedGold,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  tabs: const [
                    Tab(text: "Login"),
                    Tab(text: "Sign Up"),
                  ],
                ),
              ),
              verticalSpace(20.h),
              const Expanded(
                child: TabBarView(
                  children: [
                    LoginScreen(),
                    SignUpScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
