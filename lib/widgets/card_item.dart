import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 0,
                offset: const Offset(10, 10),
              ),
            ],
          ),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    productModel.title.split(' ').first,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r'$' '${productModel.price}'),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 32,
            top: -60,
            child: Image.network(
              productModel.image,
              width: 100,
              height: 100,
            ))
      ],
    );
  }
}
