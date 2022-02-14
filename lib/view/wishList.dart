import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:try_work/state/products.dart';

class WishList extends StatelessWidget {
  final Products _p = Get.find<Products>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WishList'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: _p.wishListItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _p.wishListItems[index];
          return Card(
            key: ValueKey(item.id),
            margin: const EdgeInsets.all(5),
            color: Colors.blueAccent,
            child:  ListTile(
              title: Text(item.name),
              subtitle: Text(item.price.toStringAsFixed(2)),
              trailing:  IconButton(icon: const Icon(Icons.close),
                onPressed: () {
                item.inWishList.value = false;
                _p.removeItem(item.id);
                },
              ),
            ),
          );
        },
      )
      ),
    );
  }
}