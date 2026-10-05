import 'package:flutter/material.dart';
import '../models/food_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isFav = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = MediaQuery.of(context).textScaleFactor;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              'assets/images/burger_king.png',
              height: size.height * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: size.height * 0.02,
              crossAxisSpacing: size.width * 0.02,
            ),
            padding: const EdgeInsets.all(16.0),
            itemCount: food.length,
            itemBuilder: (context, index) {
              final item = food[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              item.image,
                              height: size.height * 0.15,
                              width: size.width * 0.4,
                              fit: BoxFit.fill,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                food[index] = food[index].copyWith(
                                  favorited: !food[index].favorited,
                                );
                              });
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: size.height * 0.04,
                                width: size.width * 0.08,
                                color: Colors.grey[100],
                                child: item.favorited
                                    ? Icon(
                                        Icons.favorite,
                                        color: Theme.of(context).primaryColor,
                                        size: size.height * 0.04,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                        color: Theme.of(context).primaryColor,
                                        size: size.height * 0.04,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        item.name,
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(
                              fontSize: 24 * textScale,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                        // TextStyle(fontSize: 24, color: Colors.black87),
                      ),
                      Text(
                        '\$ ${item.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
