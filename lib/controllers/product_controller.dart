import 'package:get/state_manager.dart';
import 'package:shopx/helpers/helpers.dart';
import 'package:shopx/services/remote_services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductController extends GetxController {
  RxBool isLoading = true.obs;
  var productList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
  
    productList = await RemoteServices.fetchProducts();
    isLoading.toggle();
  }
}
