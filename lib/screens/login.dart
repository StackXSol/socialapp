import 'package:flutter/material.dart';
import 'package:socialapp/widgets.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
                "Social App",
                style: TextStyle(
                    fontFamily: "Aviator",
                    fontSize: getheight(context, 95),
                    color: Colors.black),
              ),
              SizedBox(
                height: getheight(context, 124),
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
                    icon: Icon(Icons.email_sharp),
                    onPressed: null,
                  ),
                  hintText: "Your Email Address",
                )),
              ),
              SizedBox(
                height: getheight(context, 58),
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
                        filled: true,
                        hintText: "Your Password",
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.key_outlined,
                          ),
                          onPressed: null,
                        ))),
              ),
              SizedBox(
                height: getheight(context, 58),
              ),
              GestureDetector(
                onTap: () {
                  // Sign In
                },
                child: Container(
                  height: getheight(context, 79),
                  width: getwidth(context, 300),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: getheight(context, 25)),
                  )),
                ),
              ),
              SizedBox(
                height: getheight(context, 30),
              ),
              Text(
                "OR",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getheight(context, 24)),
              ),
              SizedBox(
                height: getheight(context, 44),
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
                      "Sign in with your google account",
                      style: TextStyle(fontSize: getheight(context, 20)),
                    ))),
              ),
              SizedBox(
                height: getheight(context, 69),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forget password? ",
                    style: TextStyle(fontSize: getheight(context, 20)),
                  ),
                  GestureDetector(
                    onTap: () {
                      // forgot password
                    },
                    child: Text(
                      "Click me",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: getheight(context, 20)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 59,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an google account? ",
                    style: TextStyle(fontSize: getheight(context, 20)),
                  ),
                  GestureDetector(
                    onTap: () {
                      // register google account
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: getheight(context, 20)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
