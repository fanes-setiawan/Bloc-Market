import 'package:blocmarket/data/models/response/product_model.dart';
import 'package:blocmarket/screens/detail_product.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final ProductModel productModel;

  const ItemWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailProductScreen(
            productModel: productModel,
          );
        }));
      },
      child: Card(
        color: Colors.white,
        shadowColor: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: productModel.images,
              child: SizedBox(
                width: 150,
                child: Image.network(
                  productModel.images[0],
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              productModel.title,
              style: const TextStyle(
                fontSize: 12.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "\$ ${productModel.price} | ${productModel.category.name}",
              style: const TextStyle(
                fontSize: 11.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
