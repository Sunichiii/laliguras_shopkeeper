import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopkeeper_part/core/widgets/custom%20widgets/secondary_appbar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/widgets/custom buttons/custom_quantity_button.dart';
import '../../../core/widgets/custom buttons/long_button.dart';
import '../../../data/models/vegetable_model.dart';
import '../../../providers/basket_provider.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final basketProvider = Provider.of<BasketProvider>(context);
    final recommendedItems = basketProvider.getRecommendedItems();

    return Scaffold(
      appBar: const SecondaryAppBar(title: 'Basket',),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Main Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Basket Items
                    if (basketProvider.items.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: basketProvider.items.length,
                        itemBuilder: (context, index) {
                          final item = basketProvider.items[index];
                          return _BasketItem(
                            vegetable: item,
                            onQuantityChanged: (newQuantity) {
                              basketProvider.updateQuantity(item, newQuantity);
                            },
                            onRemove: () {
                              basketProvider.removeFromBasket(item);
                            },
                          );
                        },
                      )
                    else
                      Center(
                        child: Text(
                          "Your basket is empty!",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),

                    const SizedBox(height: 20.0),

                    // Free Delivery Progress
                    Center(
                      child: Text(
                        "You are Rs ${basketProvider.freeDeliveryRemaining.toStringAsFixed((2))} away from free delivery",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0), // Circular rectangle shape
                        child: LinearProgressIndicator(
                          value: basketProvider.deliveryProgress,
                          backgroundColor: AppColors.grey,
                          color: AppColors.primary,
                          minHeight: 6.0, // Adjust the height for a better look
                        ),
                      ),
                    ),

                    const SizedBox(height: 20.0),

                    // Recommended Section
                    if (recommendedItems.isNotEmpty) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recommended",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to recommended items page
                            },
                            child: const Text("View all"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 180.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recommendedItems.length,
                          itemBuilder: (context, index) {
                            final item = recommendedItems[index];
                            return _RecommendedItem(
                              vegetable: item,
                              onAddToBasket: () {
                                basketProvider.addToBasket(item);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // Delivery and Total Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery", style: Theme.of(context).textTheme.titleMedium),
                Text("Rs ${basketProvider.deliveryCharge}",
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: Theme.of(context).textTheme.titleMedium),
                Text("Rs ${basketProvider.totalCost}",
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),

            const SizedBox(height: 20.0),

            // Go to Checkout Button
            LongButton(
              text: "Go to checkout",
              onPressed: () {
                Navigator.pushNamed(context, '/checkout');
              },
            ),
           // const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}

// Individual Basket Item Widget
class _BasketItem extends StatelessWidget {
  final Vegetable vegetable;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const _BasketItem({
    required this.vegetable,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Vegetable Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                vegetable.imagePath,
                height: 50.0,
                width: 50.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12.0),

            // Vegetable Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vegetable.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "Rs. ${vegetable.price.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),

            // Quantity Controls
            QuantityControl(
              quantity: vegetable.quantity,
              onAdd: () {
                onQuantityChanged(vegetable.quantity + 1);
              },
              onSubtract: () {
                if (vegetable.quantity > 1) {
                  onQuantityChanged(vegetable.quantity - 1);
                }
              },
            ),

            // Remove Button
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}


// Recommended Item Widget
class _RecommendedItem extends StatelessWidget {
  final Vegetable vegetable;
  final VoidCallback onAddToBasket;

  const _RecommendedItem({
    required this.vegetable,
    required this.onAddToBasket,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150.0,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.background,
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            vegetable.imagePath,
            height: 50.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          Text(
            vegetable.name,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            "Rs. ${vegetable.price.toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8.0),
          IconButton(
            icon: const Icon(Icons.add, color: AppColors.primary, size: 14,),
            onPressed: onAddToBasket,
          ),
        ],
      ),
    );
  }
}
