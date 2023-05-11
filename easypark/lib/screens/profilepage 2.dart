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
