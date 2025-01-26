import 'package:ecommerce/core/theme/color.dart';
import 'package:flutter/material.dart';

class ForgetPasswordSpacerWidget extends StatelessWidget {
  const ForgetPasswordSpacerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Spacer(),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Forget Password?",
              style: TextStyle(
                  color: MyColors.myGrey,
                  decoration: TextDecoration.underline),
            )),
      ],
    );
  }
}
