import 'package:flutter/material.dart';
import 'package:store_app/widgets/card_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Trend'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          right: 16,
          left: 16,
        ),
        child: GridView.builder(
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 90,
          ),
          itemBuilder: (context, index) {
            return const CardItem();
          },
        ),
      ),
    );
  }
}
