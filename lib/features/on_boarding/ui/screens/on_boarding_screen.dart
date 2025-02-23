import 'package:ecommerce/core/helper/sheared_preference.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/on_boarding/data/models.dart';
import 'package:ecommerce/features/on_boarding/logic/on_boarding_cubit.dart';
import 'package:ecommerce/features/on_boarding/ui/widgets/appbar_on_boarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/on_boarding_item_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<OnboardingItemModel> listOnboardingItemModel = [
      OnboardingItemModel(
        image: "assets/images/on_boarding_1.svg",
        title: "Choose Products",
      ),
      OnboardingItemModel(
        image: "assets/images/on_boarding_2.svg",
        title: "Make Payment",
      ),
      OnboardingItemModel(
        image: "assets/images/on_boarding_3.svg",
        title: "Get Your Order",
      )
    ];
    PageController controller = PageController();
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          var cubit = OnBoardingCubit.get(context);
          return Scaffold(
            appBar: AppBarOnboardingWidget(
              currentIndex: cubit.currentIndex,
              lengthList: listOnboardingItemModel.length,
            ),
            body: PageView.builder(
              onPageChanged: (int index) {
                cubit.changeIndex(index);
              },
              controller: controller,
              itemBuilder: (context, index) => Column(
                children: [
                  const Spacer(),
                  OnboardingItemWidget(
                    imageAsset: listOnboardingItemModel[index].image,
                    title: listOnboardingItemModel[index].title,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          child: const Text(
                            "Prev",
                            style: TextStyle(color: MyColors.myLightGrey),
                          ),
                          onPressed: () {
                            if (cubit.currentIndex == 0) {
                              return;
                            } else {
                              controller.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.bounceOut);
                            }
                          }),
                      const Spacer(),
                      SmoothPageIndicator(
                          controller: controller, // PageController
                          count: listOnboardingItemModel.length,
                          effect: const ExpandingDotsEffect(
                            activeDotColor: MyColors.myMutedBlue,
                          ),
                          onDotClicked: (index) {
                            controller.animateToPage(index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.bounceIn);
                          }),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          if (cubit.currentIndex == 2) {
                            CacheHelper.saveData(
                                key: "onboarding", value: true);
                            Navigator.pushReplacementNamed(
                                context, Routes.registerScreen);
                          } else {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.bounceIn);
                          }
                        },
                        child: cubit.currentIndex == 2
                            ? const Text("Get Started")
                            : const Text("Next"),
                      )
                    ],
                  ),
                  verticalSpace(20.h),
                ],
              ),
              itemCount: listOnboardingItemModel.length,
            ),
          );
        },
      ),
    );
  }
}
