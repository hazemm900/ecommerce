import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/auth/screens/login_screen.dart';
import 'package:ecommerce/features/auth/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome!", style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 5),
              Text("Sign up or Login to your Account",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: MyColors.myMutedBlue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: MyColors.myMutedGold,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  tabs: const [
                    Tab(text: "Login"),
                    Tab(text: "Sign Up"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
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
