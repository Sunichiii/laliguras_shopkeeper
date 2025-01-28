import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopkeeper_part/core/navigation/route_generator.dart';
import 'package:shopkeeper_part/providers/basket_provider.dart';
import 'package:shopkeeper_part/providers/navigation_provider.dart';
import 'package:shopkeeper_part/providers/onboarding_provider.dart';
import 'package:shopkeeper_part/providers/splash_provider.dart';
import 'package:shopkeeper_part/providers/vegetable_provider.dart';
import 'core/constants/themes.dart';


void main() {
  runApp(MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ChangeNotifierProvider(create: (_) => SplashProvider()),
      ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ChangeNotifierProvider(create: (_) => VegetableProvider()),
      ChangeNotifierProvider(create: (_) => BasketProvider()),
  ],
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: lightMode,
    initialRoute: '/splash',
    onGenerateRoute: RouteGenerator.generateRoute,
  ),
  ));
}


