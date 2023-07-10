// ignore_for_file: prefer_final_fields

import 'package:buyer/core/services/home_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../model/category_model.dart';
import '../../model/product_model.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  List<CategoryModel> _categoryModel = [];

  List<CategoryModel> get categoryModel => _categoryModel;

  List<ProductModel> _productModel = [];

  List<ProductModel> get productModel => _productModel;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> swipeToRefresh() async {
    categoryModel.clear();
    getCategory();
    productModel.clear();
    getBestSelling();
    refreshController.refreshCompleted();
    update();
  }

  HomeViewModel() {
    getCategory();
    getBestSelling();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
      }

      update();
    }).then((value) => _loading.value = false);
  }

  getBestSelling() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
      }

      update();
    }).then((value) => _loading.value = false);
  }
}
