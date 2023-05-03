import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:easypark/model/user.dart';
import 'package:easypark/screens/edit_profile_page.dart';
import 'package:easypark/utils/user_preferences.dart';
import 'package:easypark/widgets/appbar_widget.dart';
import 'package:easypark/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  String link = "";
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            backgroundColor: Colors.orangeAccent,
          )),
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/doctor.png'),
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            fit: BoxFit.fill,
          )),
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                // padding: EdgeInsets.all(8.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircleAvatar(
                    radius: 55,
                    // child: Align(
                    // alignment: Alignment.bottomRight,
                    // child: Icon(Icons.change_circle_outlined,color: Colors.blueAccent,size: 30,)),
                    backgroundImage: AssetImage("doc.jpg"),
                  ),
                  SizedBox(
                    width: 36,
                  ),
                  Card("USER1", "patient", 25, 19),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orangeAccent),
                    color: Colors.white.withOpacity(0.5)),
                margin: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                padding: EdgeInsets.all(20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card("Age", "54", 25, 19),
                      SizedBox(
                        width: 20,
                      ),
                      Card("Parkinson", "yes/no", 25, 19),
                      SizedBox(
                        width: 20,
                      ),
                    ]),
              ),
              Container(
                // decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                margin: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                // padding: EdgeInsets.all(20.0),
                child: Column(
                    // margin: const EdgeInsets.fromLTRB(25,15,25,15),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card("Edit Profile", "Details", 20, 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Edit"),
                      ),
                      SizedBox(height: 20),
                      Card("about", "Details", 20, 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("view"),
                      ),
                      SizedBox(height: 20),
                      Card("logout", "Details", 20, 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Edit"),
                      )
                    ]),
              ),
              // Container(
              //   margin: const EdgeInsets.fromLTRB(25, 15, 25, 15),
              //   // padding: EdgeInsets.all(20.0),
              //   child: Column(
              //       // margin: const EdgeInsets.fromLTRB(25,15,25,15),
              //       // mainAxisAlignment: MainAxisAlignment.s,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Card(
              //             "Favourite Meals", "45 meals saved on favorites", 20, 16),
              //         SizedBox(
              //           height: 10,
              //         ),
              //         Row(
              //           children: [
              //             Image.asset(
              //               "images/fd1.jpg",
              //               width: 40,
              //               height: 40,
              //               fit: BoxFit.fill,
              //             ),
              //             SizedBox(width: 10),
              //             Image.asset(
              //               "images/fd2.jpg",
              //               width: 40,
              //               height: 40,
              //               fit: BoxFit.fill,
              //             ),
              //             SizedBox(width: 10),
              //             Image.asset(
              //               "images/fd3.jpg",
              //               width: 40,
              //               height: 40,
              //               fit: BoxFit.fill,
              //             ),
              //             SizedBox(width: 10),
              //             Image.asset(
              //               "images/fd4.jpg",
              //               width: 40,
              //               height: 40,
              //               fit: BoxFit.fill,
              //             ),
              //             SizedBox(width: 10),
              //             Container(
              //               height: 40,
              //               width: 40,
              //               color: Colors.orangeAccent[100],
              //               child: Align(
              //                   alignment: Alignment.center,
              //                   child: Icon(
              //                     Icons.add_photo_alternate_outlined,
              //                     color: Colors.black,
              //                   )),
              //             )
            ],
          )),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Card(String a, String b, double x, double y) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          a,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: x),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          b,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: y),
        )
      ]),
    );
  }
}
