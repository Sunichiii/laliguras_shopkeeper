import 'package:flutter/material.dart';

import '../../core/widgets/custom widgets/secondary_appbar.dart';


class ProfileSetupPage extends StatelessWidget {
  const ProfileSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: "Profile Setup"),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: ProfileSetupForm(), // Modular form widget
      ),
      bottomNavigationBar:  BottomNavigationBar(items: items),
    );
  }
}
