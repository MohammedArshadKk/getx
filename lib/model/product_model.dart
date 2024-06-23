import 'dart:io';

import 'package:hive_flutter/adapters.dart';
part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)    
  final String image;
  @HiveField(1)
  final String productName;
  @HiveField(2)
  final String price;
  @HiveField(3)
  final String color;
  @HiveField(4)
  final String itemCount;

  ProductModel(
      {required this.image,
      required this.productName,
      required this.price,
      required this.color,
      required this.itemCount});
}
