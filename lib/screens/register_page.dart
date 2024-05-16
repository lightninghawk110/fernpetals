import 'dart:developer';
import 'package:fern_n_petals/Routes/Route_Paths.dart';
import 'package:fern_n_petals/viewmodel/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isvisible = true;
  void _toggle() {
    setState(() {
      isvisible = !isvisible;
    });
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();

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
              'assets/images/registerimg.png',
              height: MediaQuery.of(context).size.height / 2.6,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 550,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.shade100.withOpacity(0.7),
                      spreadRadius: 10,
                      blurRadius: 20,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36.0),
                      topRight: Radius.circular(36.0)),
                  color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Welcome To FNP!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Happiness is just a click away",
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
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: nameController,
                      decoration: InputDecoration(

                          //contentPadding: EdgeInsets.all(5),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            size: 18,
                          ),
                          hintTextDirection: TextDirection.ltr,
                          hintStyle: TextStyle(
                            fontSize: 13,
                          ),
                          hintText: "Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
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
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Something";
                        } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return null;
                        } else {
                          return "enter valid email";
                        }
                      },
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
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                      decoration: isvisible
                                          ? TextDecoration.none
                                          : TextDecoration.lineThrough,
                                      color: isvisible
                                          ? Color.fromARGB(255, 136, 134, 82)
                                          : Colors.blue,
                                      fontSize: 13),
                                ),
                              )),
                          hintText: "Enter Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Something";
                        } else if (!RegExp(
                                r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$')
                            .hasMatch(value)) {
                          return 'Enter a valid password';
                        } else {
                          return null;
                        }
                      },
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
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: mobileController,
                      decoration: InputDecoration(

                          //contentPadding: EdgeInsets.all(5),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.phone_android_sharp,
                            size: 18,
                          ),
                          hintTextDirection: TextDirection.ltr,
                          hintStyle: TextStyle(
                            fontSize: 13,
                          ),
                          hintText: "Enter Phone Number"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Something";
                        } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'Enter a valid phone number';
                        } else {
                          return null;
                        }
                      },
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
                      child: Consumer<LoginProvider>(
                          builder: (context, provider, child) {
                        return TextButton(
                          onPressed: () async {
                            String fullName = nameController.text;
                            List<String> nameParts = fullName.split(' ');

                            String firstName =
                                nameParts.isNotEmpty ? nameParts[0] : '';
                            String lastName = nameParts.length > 1
                                ? nameParts.sublist(1).join(' ')
                                : '';

                            if (formkey.currentState!.validate()) {
                              await provider.register(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  fname: firstName,
                                  lname: lastName,
                                  mobile: mobileController.text);
                            } else {}
                            ;
                            provider.isRegistered
                                ? Navigator.of(context)
                                    .pushReplacementNamed(RoutePaths.login)
                                : ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                    content: Text('Error'),
                                  ));
                          },
                          child: Center(
                            child: provider.isLoading
                                ? CircularProgressIndicator()
                                : Text(
                                    "Start Gifting",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        );
                      }),
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
