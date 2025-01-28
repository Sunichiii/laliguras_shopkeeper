import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/custom buttons/long_button.dart';
import '../../../core/widgets/custom widgets/secondary_appbar.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentMethod = "Esewa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: 'Payment'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Payment Methods Section
            _buildPaymentOption("Esewa"),
            _buildPaymentOption("Cash on delivery"),
            _buildPaymentOption("Khalti"),

            const SizedBox(height: 20.0), // Add spacing between options and button

            // Pay Button
            Center(
              child: LongButton(
                text: "Pay",
                onPressed: () {
                  // Handle payment action
                  print("Payment Method Selected: $_selectedPaymentMethod");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String paymentMethod) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        title: Text(
          paymentMethod,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        trailing: Radio<String>(
          value: paymentMethod,
          groupValue: _selectedPaymentMethod,
          activeColor: AppColors.primary,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
      ),
    );
  }
}
