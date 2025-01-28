import 'package:flutter/material.dart';
import 'package:shopkeeper_part/core/widgets/custom%20widgets/bottom_navbar.dart';
import 'package:shopkeeper_part/core/widgets/custom%20widgets/secondary_appbar.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Orders"),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
