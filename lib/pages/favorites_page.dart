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
    final size = MediaQuery.of(context).size;

    if (!hasFavorites) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.1, width: size.height * 0.1),
            Image.asset(
              "assets/images/empty.png",
              height: size.height * 0.3,
              width: size.height * 0.3,
            ),
            SizedBox(height: size.height * 0.1, width: size.height * 0.1),
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.02,
            ),
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
