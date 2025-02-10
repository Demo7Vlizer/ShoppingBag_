import 'package:get/get.dart';
import 'product.dart';

class CartItem {
  final Product product;
  RxInt quantity;

  CartItem({
    required this.product,
    int initialQuantity = 1,
  }) : quantity = initialQuantity.obs;

  double get totalPrice => product.price.toDouble() * quantity.value.toDouble();
}

class CartController extends GetxController {
  final RxMap<int, CartItem> _items = <int, CartItem>{}.obs;

  Map<int, CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.totalPrice;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(product: product);
    }
    update();
  }

  void removeItem(int productId) {
    _items.remove(productId);
    update();
  }

  void updateQuantity(int productId, int quantity) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity.value = quantity;
      update();
    }
  }
}