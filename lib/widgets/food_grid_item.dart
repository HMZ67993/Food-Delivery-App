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
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(
                    item.image,
                    fit: BoxFit.contain,
                    height: constraints.maxHeight * 0.65,
                    width: constraints.maxWidth * 0.65,
                  ),
                  InkWell(
                    onTap: onFavoriteTap,
                    child: Container(
                      height: constraints.maxHeight * 0.1,
                      width: constraints.maxWidth * 0.1,
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

              Text(
                item.name,
                style: TextStyle(
                  fontSize: constraints.maxHeight * 0.12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: constraints.maxHeight * 0.1,
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
