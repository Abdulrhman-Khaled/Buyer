// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../constatnts/colors.dart';
import '../../model/product_model.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key, this.productModel});

  ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Ionicons.chevron_back,
            color: AppColors.orange,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              
            },
            icon: const Icon(
              Ionicons.bag_outline,
              color: AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
