import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isvisible = false;
  void _toggle() {
    setState(() {
      isvisible = !isvisible;
    });
  }

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            child: Image.asset(
              'assets/images/loginpageimg3.png',
              height: MediaQuery.of(context).size.height / 2.6,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 280,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.shade100.withOpacity(0.7),
                      spreadRadius: 10,
                      blurRadius: 20,
                    )
                  ],
                  borderRadius: BorderRadius.circular(35.0),
                  color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Sign Up / Login to FNP!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "For a personalized experience & faster checkout",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 340,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey.shade300)),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(

                          //contentPadding: EdgeInsets.all(5),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 18,
                          ),
                          hintTextDirection: TextDirection.ltr,
                          hintStyle: TextStyle(
                            fontSize: 13,
                          ),
                          hintText: "Enter Email Address"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 340,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey.shade300)),
                    child: TextField(
                      obscureText: isvisible,
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.password_outlined,
                            size: 18,
                          ),
                          hintTextDirection: TextDirection.ltr,
                          hintStyle: TextStyle(
                            fontSize: 13,
                          ),
                          suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: InkWell(
                                onTap: () => _toggle(),
                                child: Text(
                                  "Show",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 136, 134, 82),
                                      fontSize: 13),
                                ),
                              )),
                          hintText: "Enter Password"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color.fromARGB(255, 136, 134, 82),
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () => {},
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          " or Login with",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Expanded(child: Divider())
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Center(
                      child: Image.asset(
                        'assets/images/googleimg.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "By continuing you agree to FNP's",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text("Terms & Conditions & Privacy Policy",
                      style: TextStyle(
                          fontSize: 12.5, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
