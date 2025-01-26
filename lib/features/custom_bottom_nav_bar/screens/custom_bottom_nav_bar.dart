import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/custom_bottom_nav_bar/logic/custom_bottom_nav_bar_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          var cubit = BottomNavBarCubit.get(context);
          PersistentTabController controller;

          controller = PersistentTabController(initialIndex: 0);

          return PersistentTabView(
            context,
            controller: controller,
            screens: cubit.screens,
            onItemSelected: (int value) {
              cubit.changeCurrentIndex(value);
            },
            items: [
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: MyColors.myMutedGold,
                inactiveColorPrimary: MyColors.myMutedBlue,
                // scrollController: settingScrollController,
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.cart),
                title: ("Cart"),
                activeColorPrimary: MyColors.myMutedGold,
                inactiveColorPrimary: MyColors.myMutedBlue,
                // scrollController: settingScrollController,
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.heart),
                title: ("Favorites"),
                activeColorPrimary: MyColors.myMutedGold,
                inactiveColorPrimary: MyColors.myMutedBlue,
                // scrollController: settingScrollController,
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.settings),
                title: ("Settings"),
                activeColorPrimary: MyColors.myMutedGold,
                inactiveColorPrimary: MyColors.myMutedBlue,
              ),
            ],
            backgroundColor:  Colors.white,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            decoration: const NavBarDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style1,
            navBarHeight: kBottomNavigationBarHeight,
          );
        },
      ),
    );
  }
}
