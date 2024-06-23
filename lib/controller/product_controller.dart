import 'package:get/get.dart';
import 'package:getx/model/product_model.dart';
import 'package:hive_flutter/adapters.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  late Box<ProductModel> productsBox;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    openBoxAndFetchProducts();
  }

  addAllProduct(ProductModel product) async {
    await productsBox.add(product);
    productList.add(product);
  }

  Future<void> openBoxAndFetchProducts() async {
    productsBox = await Hive.openBox<ProductModel>('products');
    getAllProduct();
  }

  getAllProduct() async {
    productList.value = productsBox.values.toList();
  }

  editAllProduct(int index, ProductModel updatedProduct) async {
    productsBox.putAt(index, updatedProduct);
    productList[index]=updatedProduct;
  }
  Future<void> delete(int index) async {
    productsBox.deleteAt(index);  
    await productList.removeAt(index);
  }
}
