import 'package:betting_app/cart_page.dart';
import 'package:betting_app/colors.dart';
import 'package:betting_app/dimensions.dart';
import 'package:betting_app/homepagebody.dart';
import 'package:betting_app/models/cart_controller.dart';
import 'package:betting_app/models/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<PopularProductsController>(builder: (popularprod) {
          return SafeArea(
              child: Column(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top: Dimensions.margin10),
                padding: EdgeInsets.fromLTRB(Dimensions.width_10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Haryana",
                          style: TextStyle(
                              fontSize: Dimensions.fontsize20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.maincolor),
                        ),
                        Row(
                          children: const [
                            Text(
                              "Gurugram",
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: Dimensions.width_30,
                          height: Dimensions.height53,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.circularradius15),
                            color: AppColors.maincolor,
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: Dimensions.width20,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width_2,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: Dimensions.width_10),
                          width: Dimensions.width_30,
                          height: Dimensions.height53,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.circularradius15),
                            color: AppColors.maincolor,
                          ),
                          child: Icon(
                            Icons.mic,
                            color: Colors.white,
                            size: Dimensions.width20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SingleChildScrollView(child: HomePageBody()),
              ),
            ],
          ));
        }),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) {
            return Container(
              height: Dimensions.height50,
              decoration: BoxDecoration(
                  color: AppColors.maincolor,
                  borderRadius:
                      BorderRadius.circular(Dimensions.circularradius15)),
              child: GetBuilder<CartController>(
                builder: (cartcontroller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.white,
                        size: Dimensions.height20,
                      ),
                      Icon(
                        Icons.archive,
                        color: Colors.white,
                        size: Dimensions.height20,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const CartPage()));
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: Dimensions.height20,
                          )),
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: Dimensions.height20,
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ));
  }
}

