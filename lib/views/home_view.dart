import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/widgets/card_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<ProductModel>>? future;
  @override
  void initState() {
    future = GetAllProductsService().getAllProducts();
    super.initState();
  }

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
        body: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  right: 16,
                  left: 16,
                  bottom: 16,
                ),
                child: GridView.builder(
                  itemCount: snapshot.data!.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 90,
                  ),
                  itemBuilder: (context, index) {
                    return CardItem(productModel: snapshot.data![index]);
                  },
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
