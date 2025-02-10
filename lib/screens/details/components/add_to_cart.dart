import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../models/cart_item.dart';
import '../../../models/product.dart';
import '../../cart/cart_screen.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: product.color),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                colorFilter: ColorFilter.mode(product.color, BlendMode.srcIn),
              ),
              onPressed: () {
                final cartItem = cartController.items[product.id];
                if (cartItem == null || cartItem.quantity.value == 0) {
                  cartController.addItem(product);
                  Get.snackbar(
                    'Success',
                    'Added to Cart',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.green.withOpacity(0.1),
                    colorText: Colors.green,
                  );
                } else {
                  Get.snackbar(
                    'Notice',
                    'Item already in cart',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.blue.withOpacity(0.1),
                    colorText: Colors.blue,
                  );
                }
              },
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                final cartItem = cartController.items[product.id];
                if (cartItem == null || cartItem.quantity.value == 0) {
                  cartController.addItem(product);
                }
                Get.to(() => const CartScreen());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                backgroundColor: product.color,
              ),
              child: Text(
                "Buy Now".toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
