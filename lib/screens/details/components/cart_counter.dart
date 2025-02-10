import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../models/cart_item.dart';
import '../../../models/product.dart';

class CartCounter extends StatelessWidget {
  final Product product;

  const CartCounter({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Obx(() {
      final cartItem = cartController.items[product.id];
      final quantity = cartItem?.quantity.value ?? 0;

      return Row(
        children: <Widget>[
          SizedBox(
            width: 40,
            height: 32,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              onPressed: () {
                if (quantity > 0) {
                  cartController.updateQuantity(product.id, quantity - 1);
                }
              },
              child: const Icon(Icons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
            child: Text(
              quantity.toString().padLeft(2, "0"),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            width: 40,
            height: 32,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              onPressed: () {
                if (cartController.items.containsKey(product.id)) {
                  cartController.updateQuantity(product.id, quantity + 1);
                } else {
                  cartController.addItem(product);
                }
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      );
    });
  }
}
