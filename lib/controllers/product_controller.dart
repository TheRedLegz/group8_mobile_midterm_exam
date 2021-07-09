import 'package:get/state_manager.dart';
import 'package:shopx/models/product.dart';
import 'package:shopx/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    productList = await RemoteServices.fetchProducts();
  }
}
