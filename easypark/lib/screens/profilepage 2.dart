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
                        child: Text("LOGOUT"),
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
