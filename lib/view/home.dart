import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:try_work/state/products.dart';
import 'package:try_work/view/wishList.dart';

class HomeScreen extends StatelessWidget {
  final Products products = Get.put(Products());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Bebelino'),
      ),
      body: Column(
        children:  [
          const SizedBox(height: 20),
          InkWell(
            child: Container(
              width: 300,
              height: 80,
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: Obx(() => Text("WishList:${products.wishListItems.length}",
              style: const TextStyle(fontSize: 25, color: Colors.black),))
            ),
            onTap: () =>Navigator.push(context,MaterialPageRoute(builder: (context) => WishList()))
          ),
          const SizedBox(height: 20),
          Expanded(
              child: ListView.builder(
                  itemCount: products.items.length,
                  itemBuilder: (context,index) {
                    final product = products.items[index];
                    return Card(
                      key: ValueKey(product.id),
                      margin: const EdgeInsets.all(5),
                      color: Colors.redAccent,
                      child:  ListTile(
                        title: Text(product.name),
                        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                        trailing: Obx(() => IconButton(
                          onPressed: () {
                            if(product.inWishList.value == false) {
                              products.addItem(product.id);
                            }
                            else {
                              products.removeItem(product.id);
                            }
                          },
                          icon: Icon(Icons.favorite,color: product.inWishList.value == false?Colors.white:Colors.red),
                        )
                        ),
                      ),
                    );
                  }
                  )
          )
        ],
      ),
    );
  }
}