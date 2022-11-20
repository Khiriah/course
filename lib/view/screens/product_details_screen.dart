import 'package:course/model/product_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({required this.productModels, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ImageSliders(
              //   imageUrl: productModels.image,
              // ),
              // ClothesInfo(
              //   title: productModels.title,
              //   productId: productModels.id,
              //   rate: productModels.rating.rate,
              //   description: productModels.description,
              // ),
              // const SizeList(),
              // AddCart(
              //   price: productModels.price,
              //   productModels: productModels,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}