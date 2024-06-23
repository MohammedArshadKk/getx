import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/image_controller.dart';
import 'package:getx/controller/product_controller.dart';
import 'package:getx/model/product_model.dart';

class EditProduct extends StatelessWidget {
   final ProductModel product;
   int index;
   EditProduct({required this.index, required this.product ,super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final ProductCon = Get.find<ProductController>();
    final _formKey = GlobalKey<FormState>();
    controller.productNameController.text= product.productName;
    controller.priceController.text=product.price;
    controller.itemCountController.text=product.itemCount;
    controller.colorController.text=product.color; 
    controller.image.value=File(product.image);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              InkWell(
                onTap: controller.pickImage,
                child: Obx(() {
                  return controller.image.value == null
                      ? Container(
                          height: 200,
                          color: Colors.grey[200],
                          child: const Icon(Icons.add_a_photo, size: 50),
                        )
                      : Image.file(
                          controller.image.value!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                }),
              ),
              TextFormField(
                controller: controller.productNameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.priceController,
                decoration: const InputDecoration(labelText: 'Price'),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.itemCountController,
                decoration: const InputDecoration(labelText: 'Item Count'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter item count';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.colorController,
                decoration: const InputDecoration(labelText: 'Color'),  
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter color';
                  }
                  
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final product = ProductModel(
                      image: controller.image.value!.path,
                      productName: controller.productNameController.text,
                      price: controller.priceController.text,
                      color: controller.colorController.text,
                      itemCount: controller.itemCountController.text,
                    );
                    ProductCon.editAllProduct(index,product);
                    
                  }
                  //     controller.productNameController.text,
                  //     controller.priceController.text,
                  //     controller.itemCountController.text,
                  //     controller.contactNoController.text,
                  //     controller.image.value
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// submitingdata(name, price, count, contact, image ,controller) {

//   if (name != null &&
//       price != null &&
//       count != null &&
//       contact != null &&
//       image != null) {
//    final product= ProductModel(
//         image: image,
//         productName: name,
//         price: price,
//         contactNo: contact,
//         itemCount: count);
        
//     Get.snackbar('good', 'added');
//   } else {
//     Get.snackbar('alert', 'fill all Column');
//   }
// }
