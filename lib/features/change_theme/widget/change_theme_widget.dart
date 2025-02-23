import 'package:ecommerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../change_theme_cubit/change_theme_cubit.dart';
import '../change_theme_cubit/change_theme_state.dart';

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        var cubit = ChangeThemeCubit.get(context);
        return ListTile(
          title: const Text("Change Theme Mode"),
          trailing: IconButton(
            onPressed: () {
              cubit.changeTheme();
            },
            icon: Icon(
              cubit.isDark
                  ? Icons.dark_mode
                  : Icons.light_mode, // Change icon dynamically
              color: MyColors.myMutedGold,
            ),
          ),
        );
      },
    );
  }
}
