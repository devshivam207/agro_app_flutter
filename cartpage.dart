import 'package:betting_app/colors.dart';
import 'package:betting_app/homeheader.dart';
import 'package:betting_app/models/cart_controller.dart';
import 'package:betting_app/models/popular_product_controller.dart';
import 'package:betting_app/models/recommended_product_controller.dart';
import 'package:betting_app/recommendediteminfo.dart';
import 'package:betting_app/slideriteminfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'dimensions.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height40,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Dimensions.height40,
                    width: Dimensions.width_20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.maincolor,
                    ),
                    child: InkWell(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const MyHomePage()))),
                      },
                      child: Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: Dimensions.circularradius25,
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height40,
                    width: Dimensions.width_20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.maincolor,
                    ),
                    child: InkWell(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const MyHomePage()))),
                      },
                      child: Icon(
                        Icons.home_outlined,
                        size: Dimensions.circularradius25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
              top: Dimensions.height10 * 8,
              left: Dimensions.width5,
              right: Dimensions.width5,
              bottom: Dimensions.height100,
              child: Container(
                  color: Colors.white,
                  child: GetBuilder<CartController>(
                    builder: (cartcontrol) {
                      return ListView.builder(
                          itemCount: cartcontrol.getItems.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                var popIndex =
                                    Get.find<PopularProductsController>()
                                        .popularProductList
                                        .indexOf(cartcontrol
                                            .getItems[index].product!);
                                if (popIndex >= 0) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((context) =>
                                          SliderInfo(id: popIndex))));
                                } else {
                                  var recomIndex =
                                      Get.find<RecommendedProductController>()
                                          .recommendedproductlist
                                          .indexOf(cartcontrol
                                              .getItems[index].product!);
                                  if (recomIndex >= 0) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                RecommendedItemInfo(
                                                    id: recomIndex))));
                                  }
                                }
                              },
                              child: Container(
                                height: Dimensions.height100,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent.shade100,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.circularradius15)),
                                margin: EdgeInsets.all(Dimensions.height5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: Dimensions.width5,
                                    ),
                                    Container(
                                      width: Dimensions.width_50,
                                      height: Dimensions.width_50,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.circularradius20),
                                          image: DecorationImage(
                                              image: NetworkImage(cartcontrol
                                                  .getItems[index].img
                                                  .toString()),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                    Expanded(
                                        child: Container(
                                      height: Dimensions.height100,
                                      decoration: BoxDecoration(
                                          color: Colors.greenAccent.shade100,
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.circularradius15)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartcontrol.getItems[index].name!,
                                            style: TextStyle(
                                                fontSize:
                                                    Dimensions.height5 * 3,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            cartcontrol
                                                .getItems[index].company!,
                                            style: TextStyle(
                                                color: Colors.purple,
                                                fontSize:
                                                    Dimensions.height7 * 2,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "\$ ${cartcontrol.getItems[index].price}",
                                                style: TextStyle(
                                                    color: Colors.brown,
                                                    fontSize:
                                                        Dimensions.height5 * 3,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsetsDirectional.only(
                                                        end: Dimensions
                                                            .margin10),
                                                height: Dimensions.height30,
                                                width: Dimensions.width_40,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius
                                                        .circular(Dimensions
                                                            .circularradius20)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () =>
                                                          cartcontrol.additem(
                                                              cartcontrol
                                                                  .getItems[
                                                                      index]
                                                                  .product!,
                                                              -1),
                                                      child: Icon(
                                                        Icons.remove,
                                                        size: Dimensions
                                                            .edgeinsertltrb20,
                                                      ),
                                                    ),
                                                    Text(
                                                      cartcontrol
                                                          .getItems[index]
                                                          .quantity
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: Dimensions
                                                            .fontsize17,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () =>
                                                          cartcontrol.additem(
                                                              cartcontrol
                                                                  .getItems[
                                                                      index]
                                                                  .product!,
                                                              1),
                                                      child: Icon(
                                                        Icons.add,
                                                        size: Dimensions
                                                            .edgeinsertltrb20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  ))),
          GetBuilder<CartController>(
            builder: (cartcontroller) {
              return Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: Dimensions.height30 * 3,
                  width: Dimensions.width_1,
                  decoration: BoxDecoration(
                      color: AppColors.maincolor,
                      borderRadius: BorderRadius.only(
                          topRight:
                              Radius.circular(Dimensions.circularradius20),
                          topLeft:
                              Radius.circular(Dimensions.circularradius20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(
                            start: Dimensions.margin20),
                        height: Dimensions.height50,
                        width: Dimensions.width_50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                Dimensions.circularradius20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$ ${cartcontroller.totalamount}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.fontsize17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //popularprod.addItem(product);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsetsDirectional.only(
                              end: Dimensions.edgeinsertltrb20),
                          height: Dimensions.height50,
                          width: Dimensions.width_80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.circularradius20)),
                          child: Text(
                            "Pay Now",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.fontsize14,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
