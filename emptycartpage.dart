import 'package:betting_app/colors.dart';
import 'package:betting_app/homeheader.dart';
import 'package:flutter/material.dart';
import 'dimensions.dart';

class EmptyCartPage extends StatelessWidget {
  const EmptyCartPage({Key? key}) : super(key: key);

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
          const Positioned(
            child: Expanded(
              child: Center(
                child: Text("Please add something to cart !!",
                style: TextStyle(
                  fontSize: 20
                ),),
              ),
            )
            )
        ],
      ),
    );
  }
}
