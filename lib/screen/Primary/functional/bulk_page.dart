import 'package:flutter/material.dart';
import 'package:shopkeeper_part/core/widgets/custom%20widgets/bottom_navbar.dart';
import 'package:shopkeeper_part/core/widgets/custom%20widgets/secondary_appbar.dart';

class BulkPage extends StatelessWidget {
  const BulkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Bulk"),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
