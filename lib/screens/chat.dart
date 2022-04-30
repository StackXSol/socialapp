import 'package:flutter/material.dart';
import 'package:socialapp/widgets.dart';

class MainChat extends StatelessWidget {
  const MainChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: getheight(context, 50),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: getwidth(context, 36)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFC4C4C4)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: getheight(context, 17)),
                child: Row(
                  children: [
                    Text(
                      "  Message Page",
                      style: TextStyle(fontSize: getheight(context, 30)),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(5), child: Text("Sign Out")),
                    ),
                    SizedBox(width: getwidth(context, 10)),
                    Column(
                      children: [Text("Hello,"), Text("Username")],
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://www.insidesport.in/wp-content/uploads/2021/11/FBx-v7JXoAAkCzM-58.jpg?w=1068&h=0&crop=1"),
                    ),
                    SizedBox(width: 10)
                  ],
                ),
              ),
            ),
            SizedBox(height: getheight(context, 21)),
            GestureDetector(
              onTap: () {
                //Go back
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: getwidth(context, 200),
                  margin: EdgeInsets.only(left: getwidth(context, 83)),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: BlueColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Icon(Icons.keyboard_return_sharp),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Go Back")
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getheight(context, 30),
            ),
            Container(
              height: getheight(context, 809),
              width: getwidth(context, 666),
              decoration: BoxDecoration(
                  color: Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: getheight(context, 20)),
                      width: getwidth(context, 600),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              height: getheight(context, 80),
                              width: getheight(context, 80),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://www.insidesport.in/wp-content/uploads/2021/11/FBx-v7JXoAAkCzM-58.jpg?w=1068&h=0&crop=1"),
                                ),
                              )),
                          SizedBox(
                            width: getwidth(context, 46),
                          ),
                          Column(
                            children: [
                              Text(
                                "Mike Butoski",
                                style: TextStyle(
                                    fontSize: getheight(context, 24),
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text("Currently online")
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Icon(
                                Icons.call,
                                size: getheight(context, 32),
                                color: Colors.grey,
                              ),
                              Text("Voice")
                            ],
                          ),
                          SizedBox(width: getwidth(context, 20)),
                          Column(
                            children: [
                              Icon(
                                Icons.video_call,
                                size: getheight(context, 32),
                                color: Colors.grey,
                              ),
                              Text("Video")
                            ],
                          ),
                          SizedBox(width: getwidth(context, 10)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
