import 'package:betting_app/cart_page.dart';
import 'package:betting_app/models/popular_product_controller.dart';
import 'package:betting_app/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'empty_cart.dart';
import 'homeheader.dart';
import 'loginpage.dart';
import 'models/dependencies.dart' as dep;
import 'models/recommended_product_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductsController>().checkPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.brown,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        "/": (context) => const  MyLoginPage(),
        "/home": (context) => const MyHomePage(),
        "/login": (context) => const MyLoginPage(),
        "/signup": (context) => const MySignUpPage(),
        "/cart": (context) => const CartPage(),
        "/emptycart":(context) => const EmptyCartPage(),
        /*"/slideriteminfo": (context) => SliderInfo(id: index), this is not use because we pass the valuee directly from hoomepagebody from where we are calling the slideriteminfo process*/
        // "/recommendediteminfo": (context) => const RecommendedItemInfo(),
      },
    );
  }
}
