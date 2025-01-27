import 'package:flutter/material.dart';
import 'package:shopkeeper_part/core/constants/colors.dart';
import 'package:shopkeeper_part/core/widgets/custom%20buttons/send_receive_button.dart';
import 'package:shopkeeper_part/core/widgets/custom%20buttons/view_more_button.dart';
import 'core/constants/themes.dart';
import 'core/widgets/custom buttons/add_button.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      home: AddButtonTest(),
    );
  }
}

class AddButtonTest extends StatefulWidget {
  @override
  _AddButtonTestState createState() => _AddButtonTestState();
}

class _AddButtonTestState extends State<AddButtonTest> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Button Test'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quantity: $counter',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            ViewMoreButton(
              text: "View More",
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
