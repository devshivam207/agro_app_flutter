import 'package:betting_app/dimensions.dart';
import 'package:betting_app/signup.dart';
import 'package:flutter/material.dart';
import 'homeheader.dart';

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 130,
            ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.height20),
              height: Dimensions.height130,
              width: Dimensions.width_375,
              child: Image.asset("images/login.png",),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 40),
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: const TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.people),
                              fillColor: Colors.blue,
                              hintText: "Enter Username",
                              labelText: "Username",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: "Enter Password",
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 160,
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 83, 175, 149),
                              borderRadius: BorderRadius.circular(30)),
                          margin: const EdgeInsets.only(left: 30, top: 30),
                          child: const Center(
                              child: Text(
                            "Forget Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          margin: const EdgeInsets.only(right: 30, top: 30),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 83, 175, 149),
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => const MyHomePage())))
                            },
                            child: const Center(
                                child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 30,
                            )),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 375,
                      height: 60,
                      margin: const EdgeInsets.only(right: 0, top: 30),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 83, 175, 149),
                          borderRadius: BorderRadius.circular(30)),
                      child: InkWell(
                        onTap: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => const MySignUpPage())))
                        },
                        child: const Center(
                            child: Text(
                          "Already have an account",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
