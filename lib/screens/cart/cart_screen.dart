import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../models/cart_item.dart';
import 'components/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(context),
      body: Obx(
        () => cartController.items.isEmpty
            ? const Center(child: Text('Your cart is empty'))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(kDefaultPaddin),
                      itemCount: cartController.items.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartController.items.values.toList()[index];
                        return CartItemCard(cartItem: cartItem);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(kDefaultPaddin),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, -15),
                          blurRadius: 20,
                          color: const Color(0xFFDADADA).withOpacity(0.15),
                        )
                      ],
                    ),
                    child: SafeArea(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total:",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Obx(
                                () => Text(
                                  "\$${cartController.totalAmount.toStringAsFixed(2)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: kDefaultPaddin),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kTextColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                "Check Out",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () => Get.back(),
      ),
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          GetX<CartController>(
            builder: (controller) => Text(
              "${controller.itemCount} items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
} 