import 'package:flutter/material.dart';
import '../models/food_items.dart';

class FavoriteItem extends StatelessWidget {
  final int foodIndex;
  final VoidCallback onFavoriteTap;

  const FavoriteItem({
    super.key,
    required this.foodIndex,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    final item = food[foodIndex];

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: orientation == Orientation.portrait
              ? constraints.maxWidth * 0.04
              : constraints.maxWidth * 0.02,
          vertical: orientation == Orientation.portrait
              ? constraints.maxWidth * 0.01
              : constraints.maxWidth * 0.005,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(constraints.maxWidth * 0.04),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  item.image,
                  height: constraints.maxWidth * 0.1,
                  width: constraints.maxWidth * 0.15,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        // color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
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
              IconButton(
                onPressed: onFavoriteTap,
                icon: Icon(
                  item.favorited ? Icons.favorite : Icons.favorite_border,
                  size: constraints.maxWidth * 0.06,
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
