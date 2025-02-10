import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/cart_item.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;

  const CartItemCard({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Dismissible(
        key: Key(cartItem.product.id.toString()),
        direction: DismissDirection.endToStart,
        background: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFFFE6E6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Row(
            children: [
              Spacer(),
              Icon(Icons.delete, color: Colors.red),
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(kDefaultPaddin),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 20,
                color: const Color(0xFFB0CCE1).withOpacity(0.32),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: 88,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: cartItem.product.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(cartItem.product.image),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.product.title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: "\$${cartItem.product.price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kTextColor,
                        ),
                        children: [
                          TextSpan(
                            text: " x${cartItem.quantity}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 