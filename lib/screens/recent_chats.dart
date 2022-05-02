import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialapp/main.dart';
import 'package:socialapp/screens/chat.dart';
import 'package:socialapp/screens/contact_list.dart';
import 'package:socialapp/widgets.dart';

class RecentChats extends StatefulWidget {
  const RecentChats({Key? key}) : super(key: key);

  @override
  State<RecentChats> createState() => _RecentChatsState();
}

TextEditingController _emailcontro = TextEditingController();

class _RecentChatsState extends State<RecentChats> {
  String email = "";
  List<Widget> chats = [];

  @override
  void initState() {
    get_chats();
    super.initState();
  }

  Future<void> get_chats() async {
    chats = [];
    var key = await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Chats")
        .get();

    for (var i in key.docs) {
      var key1 = await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Chats")
          .doc(i.id)
          .collection("chat")
          .get();
      String lastmsg = key1.docs.last.data()["Type"] != "Text"
          ? key1.docs.last.data()["Type"] == "image"
              ? "Image File"
              : "Document File"
          : key1.docs.last.data()["msg"];
      chats.add(_Chat(
          sender: i.data()["Sender"],
          cid: i.data()["cid"],
          reciever: i.data()["Reciever"],
          name: i.data()["Reciever_Name"],
          lastmsg: lastmsg));
    }
    setState(() {});
  }

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
              margin: EdgeInsets.symmetric(horizontal: getwidth(context, 0)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFC4C4C4)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: getheight(context, 17)),
                child: Row(
                  children: [
                    Text(
                      "  Chat list",
                      style: TextStyle(fontSize: getheight(context, 30)),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        GoogleSignIn().signOut();
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("Sign Out")),
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
            SizedBox(height: getheight(context, 21)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _emailcontro,
                      onChanged: (val) {
                        email = val;
                        if (val == "") {
                          get_chats();
                          setState(() {});
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.email_sharp),
                          onPressed: null,
                        ),
                        hintText: "Email Address",
                      ),
                    ),
                  ),
                  SizedBox(),
                  IconButton(
                      onPressed: () async {
                        if (email != "" && email != appuser.email) {
                          chats = [];
                          var key = await FirebaseFirestore.instance
                              .collection("Users")
                              .where("Email", isEqualTo: email);
                          var x = await key.get();
                          chats.add(New_Chat(
                            name: x.docs.first.data()["Name"],
                            email: x.docs.first.data()["Email"],
                            uid: x.docs.first.data()["uid"],
                          ));

                          setState(() {});
                        }
                      },
                      icon: Icon(Icons.search))
                ],
              ),
            ),
            SizedBox(
              height: getheight(context, 20),
            ),
            Container(
              height: getheight(context, 788),
              width: getwidth(context, 766),
              decoration: BoxDecoration(
                  color: Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Column(children: chats),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Chat extends StatelessWidget {
  _Chat(
      {required this.sender,
      required this.reciever,
      required this.name,
      required this.cid,
      required this.lastmsg});

  String sender, reciever, name, lastmsg, cid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainChat(
                    cid: cid, name: name, reciever: reciever, sender: sender)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: getheight(context, 20)),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                        height: getheight(context, 48),
                        width: getheight(context, 48),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShpioF-xi4bFhRAuMCfhSSFUVpBchghoELbw&usqp=CAU"),
                          ),
                        )),
                    Positioned(
                      top: getheight(context, 35),
                      left: getwidth(context, 45),
                      child: Container(
                        height: getheight(context, 15),
                        width: getheight(context, 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: getwidth(context, 22),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getheight(context, 18),
                          color: Colors.black),
                    ),
                    SizedBox(
                        height: getheight(
                      context,
                      8,
                    )),
                    Text(
                      lastmsg,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: getwidth(context, 15),
                ),
              ],
            ),
          ),
          Divider(
            height: 2,
            endIndent: getheight(context, 70),
            indent: getheight(context, 70),
            color: Color(0xFF808080),
          ),
        ],
      ),
    );
  }
}

class New_Chat extends StatelessWidget {
  New_Chat({required this.name, required this.uid, required this.email});

  String name, uid, email;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _emailcontro.text = "xyz...";
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("Chats")
            .doc(FirebaseAuth.instance.currentUser!.uid.toString() +
                "-" +
                uid.toString())
            .set({
          "Reciever": uid,
          "Reciever_Name": name,
          "Sender_Name": appuser.name,
          "cid": FirebaseAuth.instance.currentUser!.uid.toString() +
              "-" +
              uid.toString(),
          "Sender": FirebaseAuth.instance.currentUser!.uid.toString()
        });
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(uid)
            .collection("Chats")
            .doc(FirebaseAuth.instance.currentUser!.uid.toString() +
                "-" +
                uid.toString())
            .set({
          "Reciever": FirebaseAuth.instance.currentUser!.uid.toString(),
          "Sender_Name": name,
          "cid": FirebaseAuth.instance.currentUser!.uid.toString() +
              "-" +
              uid.toString(),
          "Reciever_Name": appuser.name,
          "Sender": uid
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainChat(
                    cid: FirebaseAuth.instance.currentUser!.uid.toString() +
                        "-" +
                        uid.toString(),
                    name: name,
                    reciever: uid,
                    sender: FirebaseAuth.instance.currentUser!.uid)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: getheight(context, 20)),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                        height: getheight(context, 48),
                        width: getheight(context, 48),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShpioF-xi4bFhRAuMCfhSSFUVpBchghoELbw&usqp=CAU"),
                          ),
                        )),
                    Positioned(
                      top: getheight(context, 35),
                      left: getwidth(context, 45),
                      child: Container(
                        height: getheight(context, 15),
                        width: getheight(context, 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: getwidth(context, 22),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getheight(context, 18),
                          color: Colors.black),
                    ),
                    SizedBox(
                        height: getheight(
                      context,
                      8,
                    )),
                    Text(
                      "Start the chat!",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: getwidth(context, 15),
                ),
              ],
            ),
          ),
          Divider(
            height: 2,
            endIndent: getheight(context, 70),
            indent: getheight(context, 70),
            color: Color(0xFF808080),
          ),
        ],
      ),
    );
  }
}
