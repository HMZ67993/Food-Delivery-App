import 'package:flutter/material.dart';
import '../models/food_items.dart';

class FoodGridItem extends StatelessWidget {
  final int itemIndex;
  final VoidCallback onFavoriteTap;

  const FoodGridItem({
    super.key,
    required this.itemIndex,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final item = food[itemIndex];
    // final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    item.image,
                    fit: BoxFit.contain,
                    height: constraints.maxHeight * 0.55,
                    width: constraints.maxWidth * 0.55,
                  ),
                  InkWell(
                    onTap: onFavoriteTap,
                    child: Container(
                      height: constraints.maxHeight * 0.04,
                      width: constraints.maxWidth * 0.08,
                      color: Colors.grey[100],
                      child: item.favorited
                          ? Icon(
                              Icons.favorite,
                              color: Theme.of(context).primaryColor,
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: Theme.of(context).primaryColor,
                            ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
