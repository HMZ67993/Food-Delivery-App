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
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [BoxShadow(blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              width: size.width * 0.4,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      // height: size.height * 0.15,
                      child: Image.asset(item.image, fit: BoxFit.contain),
                    ),
                  ),
                  InkWell(
                    onTap: onFavoriteTap,
                    child: Container(
                      height: size.height * 0.04,
                      width: size.width * 0.08,
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
    );
  }
}
