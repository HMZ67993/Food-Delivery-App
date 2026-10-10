import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

Widget voucherOrderItem(
  BuildContext context, {
  required String name,
  required int number,
}) {
  return Column(
    children: [
      Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
      Text(
        number.toString(),
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).primaryColor,
        ),
      ),
    ],
  );
}

Widget accountClickables(
  BuildContext context, {

  required String title,
  String? subTitle,
  required IconData icon,
}) {
  Orientation orientation = MediaQuery.of(context).orientation;
  return ListTile(
    leading: Icon(icon, size: orientation == Orientation.portrait ? 30 : 50),
    title: Text(title),
    subtitle: subTitle != null ? Text(subTitle) : null,
    trailing: Icon(
      Icons.chevron_right_rounded,
      size: orientation == Orientation.portrait ? 30 : 50,
    ),
    onTap: () => debugPrint("$title clicked"),
  );
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 20, width: 20),
            if (orientation == Orientation.portrait) ...[
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(),
                  image: DecorationImage(
                    image: AssetImage("assets/images/profile.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                "Hamza Mansour",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  voucherOrderItem(context, name: "Orders", number: 15),
                  voucherOrderItem(context, name: "Vouchers", number: 3),
                ],
              ),
            ],
            if (orientation == Orientation.landscape) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(),
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Hamza Mansour",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: size.width * 0.05,
                        children: [
                          voucherOrderItem(context, name: "Orders", number: 15),
                          const SizedBox(width: 20),
                          voucherOrderItem(
                            context,
                            name: "Vouchers",
                            number: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
            SizedBox(height: 10),
            Divider(),
            accountClickables(
              context,
              title: "Past Orders",
              icon: Icons.shopping_cart,
            ),
            Divider(),
            accountClickables(
              context,
              title: "Available Vouchers",
              icon: Icons.wallet_giftcard_rounded,
            ),
            Divider(),
            accountClickables(
              context,
              title: "Hot offers",
              icon: Icons.whatshot_sharp,
            ),
          ],
        ),
      ),
    );
  }
}
