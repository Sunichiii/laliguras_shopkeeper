import 'package:flutter/material.dart';
import 'package:shopkeeper_part/core/widgets/custom%20widgets/primary_appbar.dart';
import 'package:shopkeeper_part/core/widgets/custom%20widgets/primary_navbar.dart';

class ShopkeeperHomepage extends StatefulWidget {
  const ShopkeeperHomepage({super.key});

  @override
  State<ShopkeeperHomepage> createState() => _ShopkeeperHomepageState();
}

class _ShopkeeperHomepageState extends State<ShopkeeperHomepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PrimaryAppBar(title: title, onSetupTap: onSetupTap),
      bottomNavigationBar: PrimaryNavbar(),
    );
  }
}
