class FoodItem {
  final String name;
  final double price;
  final String image;
  final String url;
  final bool favorited;

  FoodItem({
    required this.name,
    required this.price,
    required this.image,
    required this.url,
    required this.favorited,
  });

  FoodItem copyWith({
    String? name,
    double? price,
    String? image,
    String? url,
    bool? favorited,
  }) {
    return FoodItem(
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      url: url ?? this.url,
      favorited: favorited ?? this.favorited,
    );
  }
}

List<FoodItem> food = [
  FoodItem(
    name: 'Beef Burger',
    price: 10.99,
    image: 'assets/images/beef_burger.png',
    url: 'https://www.pngarts.com/files/12/Large-Burger-Sandwich-PNG-Image.png',
    favorited: true,
  ),
  FoodItem(
    name: 'Chicken Burger',
    price: 3.99,
    image: 'assets/images/chicken_burger.png',
    url: 'https://www.pngarts.com/files/3/KFC-Burger-PNG-Image.png',
    favorited: false,
  ),
  FoodItem(
    name: 'Chicken',
    price: 1.99,
    image: 'assets/images/chicken.png',
    url:
        'https://www.pngarts.com/files/11/Fried-Chicken-PNG-Image-Background.png',
    favorited: false,
  ),
  FoodItem(
    name: 'shawrma',
    price: 2.99,
    image: 'assets/images/shawrma.png',
    url:
        'https://www.pngarts.com/files/8/Chicken-Egg-Roll-PNG-Image-Transparent-Background.png',
    favorited: true,
  ),
];
