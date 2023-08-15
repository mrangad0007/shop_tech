import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_tech/controllers/productcontroller.dart';

// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shop_tech/views/product_tile.dart';

// import 'package:get/instance_manager.dart';
// import 'package:shopx/controllers/product_controller.dart';
// import 'package:shopx/views/product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.search,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.book,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'News Aggregator App',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                // IconButton(
                //     icon: Icon(Icons.view_list_rounded), onPressed: () {}),
                // IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: productController.productList.length,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemBuilder: (context, index) {
                  // return ProductTile(productController.productList[index]);
                  final product = productController.productList[index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text(product.id),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              )),
          )
          // Expanded(
          //   child: Obx(() {
          //     if (productController.isLoading.value)
          //       return Center(child: CircularProgressIndicator());
          //     else
          //       return StaggeredGridView.countBuilder(
          //         crossAxisCount: 2,
          //         itemCount: productController.productList.length,
          //         crossAxisSpacing: 16,
          //         mainAxisSpacing: 16,
          //         itemBuilder: (context, index) {
          //           return ProductTile(productController.productList[index]);
          //         },
          //         staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          //       );
          //   }),
          // )
        ],
      ),
    );
  }
}