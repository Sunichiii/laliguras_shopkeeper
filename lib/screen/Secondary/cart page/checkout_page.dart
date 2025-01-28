import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/custom buttons/long_button.dart';
import '../../../core/widgets/custom widgets/secondary_appbar.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController couponController = TextEditingController();

  bool requestInvoice = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Details Section
            Text("Details", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10.0),
            _buildInfoCard(
              icon: Icons.person_outline,
              hintText: "Enter your name",
              controller: nameController,
            ),
            _buildInfoCard(
              icon: Icons.phone_outlined,
              hintText: "Enter your phone number",
              controller: phoneController,
            ),

            const SizedBox(height: 20.0),

            // Address Section
            Text("Address", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10.0),
            _buildInfoCard(
              icon: Icons.location_on_outlined,
              hintText: "Enter your address",
              controller: addressController,
            ),
            const SizedBox(height: 10.0),
            _buildCouponInput(),

            const SizedBox(height: 20.0),

            // Order Summary Section with Outer Circular Rectangular Card
            Text(
              "Order Summary (4 items)",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildSummaryRowWithDivider("Subtotal", "Rs 360"),
                    _buildSummaryRowWithDivider("Delivery", "Rs 0"),
                    _buildSummaryRowWithDivider("Total", "Rs 340",
                        isBold: true),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Request an invoice",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Switch(
                          value: requestInvoice,
                          activeColor: AppColors.primary,
                          onChanged: (value) {
                            setState(() {
                              requestInvoice = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Pay Now Button
            LongButton(
              text: "Pay Now",
              onPressed: () {
                Navigator.pushNamed(context, '/payment');

              },
            ),
          ],
        ),
      ),
    );
  }

  // Info Card Builder
  Widget _buildInfoCard({
    required IconData icon,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.content_copy_outlined,
                color: AppColors.primary,
              ),
              onPressed: () {
                // Copy the input text to clipboard
                if (controller.text.isNotEmpty) {
                  Clipboard.setData(ClipboardData(text: controller.text));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Copied to clipboard!"),
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Coupon Input Builder
  Widget _buildCouponInput() {
    return TextField(
      controller: couponController,
      decoration: InputDecoration(
        hintText: "Enter Coupon Code",
        prefixIcon:
            const Icon(Icons.discount_outlined, color: AppColors.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
      ),
    );
  }

// Summary Row with Divider
  Widget _buildSummaryRowWithDivider(String title, String value,
      {bool isBold = false}) {
    final style = isBold
        ? Theme.of(context).textTheme.titleMedium
        : Theme.of(context).textTheme.bodyMedium;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          // Padding for the text row
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: style),
              Text(value, style: style),
            ],
          ),
        ),
        Divider(
          // Divider with no padding
          color: Colors.grey.shade400,
          thickness: 1.0,
          height: 1.0,
        ),
      ],
    );
  }
}
