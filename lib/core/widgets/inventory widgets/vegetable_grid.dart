import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../data/models/vegetable_model.dart';

class VegetableGrid extends StatefulWidget {
  final List<Vegetable> vegetables;

  const VegetableGrid({super.key, required this.vegetables});

  @override
  State<VegetableGrid> createState() => _VegetableGridState();
}

class _VegetableGridState extends State<VegetableGrid> {
  late List<bool> _favorites;

  @override
  void initState() {
    super.initState();
    // Ensure _favorites length matches the vegetables list
    _favorites = List<bool>.filled(widget.vegetables.length, false);
  }

  @override
  void didUpdateWidget(covariant VegetableGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update _favorites list if the vegetable list changes dynamically
    if (widget.vegetables.length != _favorites.length) {
      _favorites = List<bool>.filled(widget.vegetables.length, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.7,
      ),
      itemCount: widget.vegetables.length,
      itemBuilder: (context, index) {
        final vegetable = widget.vegetables[index];
        return Stack(
          children: [
            // Main Container
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.grey,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset(
                    vegetable.imagePath,
                    height: 60.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    vegetable.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "Rs. ${vegetable.price.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (starIndex) {
                      if (starIndex < vegetable.rating.toInt()) {
                        return const Icon(Icons.star,
                            color: Color(0xFFFF8A00), size: 16);
                      } else {
                        return const Icon(Icons.star,
                            color: Colors.grey, size: 16);
                      }
                    }),
                  ),
                ],
              ),
            ),
            // Favorite Button (Top-Right)
            Positioned(
              top: 8.0,
              right: 8.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _favorites[index] = !_favorites[index];
                  });
                },
                child: Icon(
                  _favorites[index] ? Icons.favorite : Icons.favorite_border,
                  color: _favorites[index] ? Colors.red : Colors.grey,
                  size: 20.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
