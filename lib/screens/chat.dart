import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socialapp/main.dart';
import 'package:socialapp/pdfviewer.dart';
import 'package:socialapp/widgets.dart';

class MainChat extends StatefulWidget {
  MainChat(
      {required this.name,
      required this.reciever,
      required this.sender,
      required this.rec_fcm,
      required this.cid});
  String name, reciever, sender, cid, rec_fcm;
  @override
  State<MainChat> createState() => _MainChatState();
}

class _MainChatState extends State<MainChat> {
  TextEditingController msgcontro = TextEditingController();
  List<Widget> chats = [];
  String type = "text";
  String docname = "";
  late File file;

  Future<void> send_noti(
      String token, String message, String sender_name, String senderid) async {
    print("Sending Notification");
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=' +
          "AAAACXteovI:APA91bGjhg0aVlHU5b09RvgHKaC3cY3fEwELv4ofzmjkKlilr2S3aJs3rqvzP55JFBUCDlm8ksOCHypKkqe6bfGTMp8O-zsi_c7_8TQd2IS6VjvdscMBMjoJRSzo-ftmMp42KOuw90lD",
    };
    final body = {
      'notification': {
        'title': sender_name,
        'body': message,
      },
      'to': token,
      'priority': 'high',
      'data': {"id": senderid},
    };
    final encoding = Encoding.getByName('utf-8');
    final uri = Uri.parse('https://fcm.googleapis.com/fcm/send');

    var response = await http.post(
      uri,
      headers: headers,
      body: json.encode(body),
      encoding: encoding,
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(100)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: msgcontro,
                onChanged: (val) {
                  type = "Text";
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: IconButton(
                      onPressed: () async {
                        if (await Permission.storage.request().isGranted) {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
                          );
                          if (result != null) {
                            file = File(result.files.single.path!);
                            PlatformFile f = result.files.first;
                            if (f.extension == "jpg" || f.extension == "png") {
                              type = "image";
                            } else if (f.extension == "pdf" ||
                                f.extension == "doc") {
                              type = "document";
                              docname = f.name;
                            }
                            setState(() {
                              msgcontro.text = file.toString();
                            });
                          }
                        } else {
                          print("Grant Permission Please!");
                        }
                      },
                      icon: Icon(Icons.attach_file)),
                  hintText: "message here!",
                ),
              ),
            ),
            SizedBox(),
            IconButton(
                onPressed: () async {
                  send_noti(
                      widget.rec_fcm,
                      type == "Text" ? msgcontro.text : "New Message!",
                      appuser.name,
                      widget.sender);
                  if (type == "Text") {
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(widget.sender)
                        .collection("Chats")
                        .doc(widget.cid)
                        .collection("chat")
                        .doc(DateTime.now().toString())
                        .set({
                      "Type": type,
                      "msg": msgcontro.text,
                      "Sender": widget.sender
                    });
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(widget.reciever)
                        .collection("Chats")
                        .doc(widget.cid)
                        .collection("chat")
                        .doc(DateTime.now().toString())
                        .set({
                      "Type": type,
                      "msg": msgcontro.text,
                      "Sender": widget.sender
                    });
                    setState(() {
                      msgcontro.text = "";
                    });
                  } else if (type == "image") {
                    Fluttertoast.showToast(msg: "Sending...");
                    setState(() {
                      msgcontro.text = "";
                    });
                    final storageRef = FirebaseStorage.instance.ref(widget.cid);
                    final chatRef = storageRef.child(DateTime.now().toString());

                    await chatRef.putFile(file);
                    String url = await chatRef.getDownloadURL();
                    print(url);

                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(widget.sender)
                        .collection("Chats")
                        .doc(widget.cid)
                        .collection("chat")
                        .doc(DateTime.now().toString())
                        .set({
                      "Type": type,
                      "msg": url,
                      "Sender": widget.sender
                    });
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(widget.reciever)
                        .collection("Chats")
                        .doc(widget.cid)
                        .collection("chat")
                        .doc(DateTime.now().toString())
                        .set({
                      "Type": type,
                      "msg": url,
                      "Sender": widget.sender
                    });
                  } else if (type == "document") {
                    Fluttertoast.showToast(msg: "Sending...");
                    setState(() {
                      msgcontro.text = "";
                    });
                    final storageRef = FirebaseStorage.instance.ref(widget.cid);
                    final chatRef = storageRef.child(DateTime.now().toString());

                    await chatRef.putFile(file);
                    String url = await chatRef.getDownloadURL();
                    print(url);

                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(widget.sender)
                        .collection("Chats")
                        .doc(widget.cid)
                        .collection("chat")
                        .doc(DateTime.now().toString())
                        .set({
                      "Type": type,
                      "msg": url,
                      "docname": docname,
                      "Sender": widget.sender
                    });
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(widget.reciever)
                        .collection("Chats")
                        .doc(widget.cid)
                        .collection("chat")
                        .doc(DateTime.now().toString())
                        .set({
                      "Type": type,
                      "msg": url,
                      "docname": docname,
                      "Sender": widget.sender
                    });
                  }
                },
                icon: Icon(Icons.send))
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: getheight(context, 54),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: getwidth(context, 0)),
            decoration: BoxDecoration(color: Color(0xFFC4C4C4)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: getheight(context, 17)),
              child: Row(
                children: [
                  Text(
                    "Message Page",
                    style: TextStyle(fontSize: getheight(context, 30)),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(5), child: Text("Sign Out")),
                    ),
                  ),
                  SizedBox(width: getwidth(context, 10)),
                  Column(
                    children: [Text("Hello,"), Text(appuser.name)],
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShpioF-xi4bFhRAuMCfhSSFUVpBchghoELbw&usqp=CAU"),
                  ),
                  SizedBox(width: 10)
                ],
              ),
            ),
          ),
          SizedBox(
            height: getheight(context, 0),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFE5E5E5),
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              margin: EdgeInsets.only(
                  top: getheight(context, 10), left: 5, right: 5, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
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
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShpioF-xi4bFhRAuMCfhSSFUVpBchghoELbw&usqp=CAU"),
                        ),
                      )),
                  SizedBox(
                    width: getwidth(context, 26),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: getheight(context, 24),
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(widget.reciever.substring(0, 15))
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
            ),
          ),
          Expanded(
            child: ListView(
              reverse: true,
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Users")
                      .doc(appuser.uid)
                      .collection("Chats")
                      .doc(widget.cid)
                      .collection("chat")
                      .snapshots(),
                  builder: (context, AsyncSnapshot futureSnapshot) {
                    if (futureSnapshot.hasData) {
                      chats = [];
                      final messages = futureSnapshot.data.docs;
                      for (var msg in messages) {
                        bool x = (appuser.uid == msg.data()["Sender"]);
                        if (x) {
                          if (msg.data()["Type"] == "Text") {
                            chats.add(
                              sender_block(que: msg.data()["msg"]),
                            );
                          } else if (msg.data()["Type"] == "image") {
                            chats.add(
                                Sender_image_block(url: msg.data()["msg"]));
                          } else if (msg.data()["Type"] == "document") {
                            chats.add(Sender_doc_block(
                              name: msg.data()["docname"],
                              url: msg.data()["msg"],
                            ));
                          }
                        } else {
                          if (msg.data()["Type"] == "Text") {
                            chats.add(reciever_block(text: msg.data()["msg"]));
                          } else if (msg.data()["Type"] == "image") {
                            chats.add(
                                Reciever_image_block(url: msg.data()["msg"]));
                          } else if (msg.data()["Type"] == "document") {
                            chats.add(Reciever_doc_block(
                              name: msg.data()["docname"],
                              url: msg.data()["msg"],
                            ));
                          }
                        }
                      }
                      return Column(
                        children: chats,
                      );
                    }
                    if (!futureSnapshot.hasData) {
                      print("do");
                      return Column(
                        children: chats,
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: getheight(context, 115),
          ),
        ],
      ),
    );
  }
}

class Sender_image_block extends StatelessWidget {
  Sender_image_block({required this.url});
  String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 8, 5),
          padding: EdgeInsets.all(3),
          width: getwidth(context, 400),
          height: getheight(context, 400),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            width: 390,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover)),
          ),
        ),
      ],
    );
  }
}

class Sender_doc_block extends StatelessWidget {
  Sender_doc_block({required this.url, required this.name});
  String name, url;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 8, 5),
          height: getheight(context, 80),
          //width: getwidth(context, 450),
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 10,
              ),
              FittedBox(
                child: Text(name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              IconButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Pdf_Viewer(doc: url)));
                  },
                  icon: Icon(
                    Icons.download,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class Reciever_doc_block extends StatelessWidget {
  Reciever_doc_block({required this.url, required this.name});
  String name, url;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(8, 0, 0, 5),
          height: getheight(context, 80),
          //width: getwidth(context, 450),
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 10,
              ),
              FittedBox(
                child: Text(name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              IconButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Pdf_Viewer(doc: url)));
                  },
                  icon: Icon(
                    Icons.download,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class Reciever_image_block extends StatelessWidget {
  Reciever_image_block({required this.url});
  String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(8, 0, 0, 5),
          padding: EdgeInsets.all(3),
          width: getwidth(context, 400),
          height: getheight(context, 400),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            width: 390,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover)),
          ),
        ),
      ],
    );
  }
}

class sender_block extends StatelessWidget {
  sender_block({required this.que});
  String que;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 200),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xff2F80ED),
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              que,
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

class reciever_block extends StatelessWidget {
  reciever_block({required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 200),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
