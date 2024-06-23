import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/model/product_model.dart';
import 'package:getx/screens/home.dart';
import 'package:hive_flutter/adapters.dart';

void main(List<String> args) {
  Hive.initFlutter();

  if(!Hive.isAdapterRegistered(ProductModelAdapter().typeId)){
    Hive.registerAdapter(ProductModelAdapter());
  }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}