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
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: getheight(context, 131),
            ),
            Text(
              "Social App",
              style: TextStyle(
                  fontFamily: "Aviator-Bold",
                  fontSize: 25,
                  color: Colors.black),
            ),
            SizedBox(
              height: getheight(context, 124),
            ),
            Container(
              child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Colors.grey,
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.email_sharp, color: Colors.white),
                        onPressed: null,
                      ),
                      hintText: "Enter username or email",
                      hintStyle: TextStyle(color: Colors.white))),
            ),
            SizedBox(
              height: getheight(context, 58),
            ),
            Container(
              child: TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fillColor: Colors.grey,
                      filled: true,
                      hintText: "Enter Password",
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ))),
            ),
            SizedBox(
              height: getheight(context, 58),
            ),
            Container(
              height: getheight(context, 79),
              width: getwidth(context, 300),
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Sign In"),
            ),
            SizedBox(
              height: getheight(context, 30),
            ),
            Text("OR"),
            SizedBox(
              height: getheight(context, 44),
            ),
            Text("Sign in with your google account"),
            SizedBox(
              height: getheight(context, 69),
            ),
            Text("Forget password? Click me"),
            SizedBox(
              height: 59,
            ),
            Text("Don't have an google account? Register")
          ],
        ),
      ),
    );
  }
}
