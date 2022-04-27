import 'package:flutter/material.dart';
import 'package:socialapp/widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  bool _isObscure = true;

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: getheight(context, 131),
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: getheight(context, 64), color: Colors.black),
              ),
              SizedBox(
                height: getheight(context, 132),
              ),
              Text(
                "Register your details",
                style: TextStyle(fontSize: getheight(context, 36)),
              ),
              SizedBox(
                height: getheight(context, 60),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 113)),
                child: const TextField(
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: null,
                  ),
                  hintText: "Your Name",
                )),
              ),
              SizedBox(
                height: getheight(context, 50),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 113)),
                child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Your Email Address",
                        prefixIcon: IconButton(
                          icon: Icon(Icons.email),
                          onPressed: null,
                        ))),
              ),
              SizedBox(
                height: getheight(context, 50),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 113)),
                child: TextField(
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        fillColor: Colors.white,
                        hintText: "Your Password",
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.key,
                          ),
                          onPressed: null,
                        ))),
              ),
              SizedBox(
                height: getheight(context, 58),
              ),
              GestureDetector(
                onTap: () {
                  // Register
                },
                child: Container(
                  height: getheight(context, 75),
                  width: getwidth(context, 300),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: getheight(context, 25)),
                  )),
                ),
              ),
              SizedBox(
                height: getheight(context, 20),
              ),
              GestureDetector(
                onTap: () {
                  // Show me how
                },
                child: Text(
                  "Show me how",
                  style: TextStyle(fontSize: getheight(context, 20)),
                ),
              ),
              SizedBox(
                height: getheight(context, 50),
              ),
              GestureDetector(
                onTap: () {
                  //Sign in with google
                },
                child: Container(
                    height: getheight(context, 60),
                    width: getwidth(context, 600),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "Sign up with your google account",
                      style: TextStyle(fontSize: getheight(context, 20)),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
