import 'package:ecommerce/core/base_widget/custom_app_bar.dart';
import 'package:ecommerce/core/base_widget/custom_cached_network_image.dart';
import 'package:ecommerce/core/base_widget/custom_material_button.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/logic/auth_cubit/auth_state.dart';
import 'package:ecommerce/features/auth/widgets/address_details_widget.dart';
import 'package:ecommerce/features/auth/widgets/personal_details_column_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>()..profile(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            appBar: const CustomAppBar(
              title: "Profile",
            ),
            body: state is ProfileLoadingState
                ? Center(
                    child: SpinKitHourGlass(
                      color: MyColors.myMutedGold,
                      size: 50.0.r,
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: CustomNetworkImage(
                                image: cubit.loginModel?.data?.image
                                            ?.isNotEmpty ==
                                        true
                                    ? cubit.loginModel!.data!.image!
                                    : "https://as1.ftcdn.net/v2/jpg/05/60/26/08/1000_F_560260880_O1V3Qm2cNO5HWjN66mBh2NrlPHNHOUxW.jpg", // Fallback URL for a placeholder image
                              ),
                            ),
                          ),
                          verticalSpace(28.h),
                          const PersonalDetailsColumnWidget(),
                          verticalSpace(28.h),
                          const AddressDetailsWidget(),
                          verticalSpace(34.h),
                          CustomMaterialButton(
                            label: "Log Out",
                            onPress: () {
                              cubit.logOut(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
