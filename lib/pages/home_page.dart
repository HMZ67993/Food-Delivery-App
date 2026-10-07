import 'package:flutter/material.dart';
import '../models/food_items.dart';
import 'package:food_delivery_app/widgets/food_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              'assets/images/burger_king.png',
              height: orientation == Orientation.portrait
                  ? size.height * 0.25
                  : size.width * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          // SizedBox(height: size.height * 0.02),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              mainAxisSpacing: size.height * 0.04,
              crossAxisSpacing: size.width * 0.04,
            ),
            padding: const EdgeInsets.all(16.0),
            itemCount: food.length,
            itemBuilder: (context, index) {
              return FoodGridItem(
                itemIndex: index,
                onFavoriteTap: () {
                  setState(() {
                    food[index] = food[index].copyWith(
                      favorited: !food[index].favorited,
                    );
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
