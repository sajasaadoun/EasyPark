import 'package:flutter/material.dart';

class FacePage extends StatefulWidget {
  const FacePage({super.key});

  @override
  State<FacePage> createState() => _FacePageState();
}

class _FacePageState extends State<FacePage> {
  List<String> str = [
    "Click on the Upload button",
    "Choose the photo of your drawing ",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavigationBar(items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.arrow_circle_left),
          label: '',
        )
      ]),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              // ignore: prefer_const_literals_to_create_immutables
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 17.0),
                        child: Text(
                          'Hello,',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'EasyPark Patient',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.person),
                  )
                ],
              ),
            ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Upload Image'),
          ),

            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: str.map((strone) {
                  return Row(children: [
                    const Text(
                      "\u2022",
                      style: TextStyle(fontSize: 15),
                    ), //bullet text
                    const SizedBox(
                      width: 10,
                    ), //space between bullet and text
                    Expanded(
                      child: Text(
                        strone,
                        style: const TextStyle(fontSize: 15),
                      ), //text
                    )
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//elevated button in container?  