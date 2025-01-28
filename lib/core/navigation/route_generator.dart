import 'package:flutter/material.dart';
import 'package:shopkeeper_part/screen/Primary/functional/bulk_page.dart';
import 'package:shopkeeper_part/screen/Primary/functional/order_page.dart';
import 'package:shopkeeper_part/screen/Primary/functional/search_page.dart';
import 'package:shopkeeper_part/screen/Primary/introduction/onboarding_screen.dart';
import 'package:shopkeeper_part/screen/Secondary/cart%20page/checkout_page.dart';
import '../../screen/Primary/functional/profile_page.dart';
import '../../screen/Primary/functional/shopkeeper_homepage.dart';
import '../../screen/Primary/introduction/splash_screen.dart';
import '../../screen/Primary/login/login_page.dart';
import '../../screen/Secondary/cart page/basket_page.dart';
import '../../screen/Secondary/cart page/pay_now_page.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) =>  ShopkeeperHomepage());
      case '/orders':
        return MaterialPageRoute(builder: (_) => const OrderPage());
      case '/search':
        return MaterialPageRoute(builder: (_) => const SearchPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case '/bulk':
        return MaterialPageRoute(builder: (_) => const BulkPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) =>  OnboardingScreen());
      case '/basket':
        return MaterialPageRoute(builder: (_) => const BasketPage());
      case '/checkout':
        return MaterialPageRoute(builder: (_) => const CheckoutPage());
      case '/payment':
        return MaterialPageRoute(builder: (_) => const PaymentPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}
