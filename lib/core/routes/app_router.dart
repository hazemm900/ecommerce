import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/address/screens/add_address_screen.dart';
import 'package:ecommerce/features/address/screens/all_addresses_screen.dart';
import 'package:ecommerce/features/auth/screens/login_screen.dart';
import 'package:ecommerce/features/auth/screens/profile_screen.dart';
import 'package:ecommerce/features/auth/screens/register_screen.dart';
import 'package:ecommerce/features/auth/screens/sign_up_screen.dart';
import 'package:ecommerce/features/cart/screens/cart_screen.dart';
import 'package:ecommerce/features/custom_bottom_nav_bar/screens/custom_bottom_nav_bar.dart';
import 'package:ecommerce/features/home/screens/home_screen.dart';
import 'package:ecommerce/features/on_boarding/ui/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case Routes.loginScreen:
        return pageRouterBuilder(screen: const LoginScreen());
      case Routes.signUpScreen:
        return pageRouterBuilder(screen: const SignUpScreen());
      case Routes.registerScreen:
        return pageRouterBuilder(screen: const RegisterScreen());
      case Routes.profileScreen:
        return pageRouterBuilder(screen: const ProfileScreen());
      case Routes.customBottomNavBarScreen:
        return pageRouterBuilder(screen: const CustomBottomNavBar());
      case Routes.homeScreen:
        return pageRouterBuilder(screen: const HomeScreen());
      case Routes.addAddressScreen:
        return pageRouterBuilder(screen: const AddAddressScreen());
      case Routes.allAddressesScreen:
        return pageRouterBuilder(screen: const AllAddressesScreen());
      case Routes.cartScreen:
        return pageRouterBuilder(screen: const CartScreen());
      case Routes.onBoardingScreen:
        return pageRouterBuilder(screen: const OnBoardingScreen());
      default:
        // Return a default error screen
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static PageRouteBuilder pageRouterBuilder({required Widget screen}) {
    return PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation<double> animation, Animation<double> seconderyAnimation) {
      const begin = Offset(-1, 0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: screen,
      );
    });
  }
}
