import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_bag/screens/cart/cart_screen.dart';
import 'constants.dart';
import 'screens/home/home_screen.dart';
import 'models/cart_item.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CartController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/cart', page: () => const CartScreen()),
      ],
    );
  }
}
