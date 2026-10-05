import 'package:flutter/material.dart';
import '../models/food_items.dart';
import '../widgets/favorite_item.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    final hasFavorites = food.any((item) => item.favorited);

    if (!hasFavorites) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50, width: 50),
            Image.asset("assets/images/empty.png", height: 250, width: 250),
            SizedBox(height: 50, width: 50),
            Text(
              "No favorites yet",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "Favorite Items",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          for (int i = 0; i < food.length; i++)
            if (food[i].favorited)
              FavoriteItem(
                foodIndex: i,
                onFavoriteTap: () {
                  setState(() {
                    food[i] = food[i].copyWith(favorited: false);
                  });
                },
              ),
        ],
      ),
    );
  }
}
