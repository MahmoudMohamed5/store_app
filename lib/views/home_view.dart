import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_categories_service.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/services/get_category_products_service.dart';
import 'package:store_app/widgets/card_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<ProductModel>> allProducts;
  late Future<dynamic> categories;

  @override
  void initState() {
    allProducts = GetAllProductsService().getAllProducts();
    categories = GetAllCategoriesService().getAllCategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait<dynamic>([
        allProducts,
        categories,
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('New Trend'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    GetCategoryProductsService()
                        .getCategoryProducts(categoryName: value)
                        .then((value) {
                      if (!context.mounted) return;
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.64,
                          minChildSize: 0.2,
                          maxChildSize: 1,
                          builder: (context, scrollController) {
                            return Container(
                              padding: const EdgeInsets.only(
                                top: 70,
                                right: 16,
                                left: 16,
                                bottom: 16,
                              ),
                              color: Colors.white,
                              child: GridView.builder(
                                controller: scrollController,
                                itemCount: value.length,
                                clipBehavior: Clip.none,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 90,
                                ),
                                itemBuilder: (context, index) {
                                  return CardItem(
                                    productModel: value[index],
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    });
                  },
                  itemBuilder: (context) {
                    return snapshot.data![1].map<PopupMenuEntry<String>>(
                      (category) {
                        return PopupMenuItem<String>(
                          value: category,
                          child: Text(category[0].toUpperCase() +
                              category.substring(1)),
                        );
                      },
                    ).toList();
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 60,
                right: 16,
                left: 16,
                bottom: 16,
              ),
              child: GridView.builder(
                itemCount: snapshot.data![0].length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 90,
                ),
                itemBuilder: (context, index) {
                  return CardItem(productModel: snapshot.data![0][index]);
                },
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
