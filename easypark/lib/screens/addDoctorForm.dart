// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DoctorForm extends StatefulWidget {
  const DoctorForm({Key? key}) : super(key: key);

  @override
  State<DoctorForm> createState() => _DoctorFormState();
}

final formkey = GlobalKey<FormState>();

class _DoctorFormState extends State<DoctorForm> {
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController AgeController = TextEditingController();
  TextEditingController LocationController = TextEditingController();
  // TextEditingController locationController = TextEditingController();
  // TextEditingController openingTimeController = TextEditingController();
  // TextEditingController closingTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(
             style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
            'Add A New doctor to your application',
            
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'admin');
            },
            child: const Icon(
              Icons.arrow_back_ios,
            size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: const AssetImage("assets/desert.jpg"),
          //   fit: BoxFit.cover,
          // ),
        ),
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Enter the doctor details please ',
                                style: TextStyle(fontSize: 20),
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: FirstNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Doctor First Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp('[a-zA-Z]').hasMatch(value)) {
                                    return "enter a correct name";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: LastNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Doctor Last Name ',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp('[a-zA-Z]').hasMatch(value)) {
                                    return "enter a correct description";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: LocationController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Doctor\'s Location',
                                ),
                                
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp('[a-zA-Z]').hasMatch(value)) {
                                    return "enter a city";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          Container(
                              height: 50,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).primaryColor,
                                ),
                                child: const Text('Submit',
                               style: TextStyle(color: Colors.white)
                               ),
                                 onPressed: () {}
                                //async {
                                //   if (formkey.currentState!.validate()) {
                                //     await placeDAta.placeAdded(
                                //       name: nameController.text,
                                //       about: aboutController.text,
                                //       city: cityController.text,
                                //       price: priceController.text,
                                //       openingTime: openingTimeController.text,
                                //       closingTime: closingTimeController.text,
                                //       location: locationController.text,
                                //     );
                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //       const SnackBar(
                                //           content: Text('Successfully Added')),
                                //     );
                                //     Navigator.pushNamed(context, '/admin');
                                //   } else {
                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //       const SnackBar(
                                //           content: Text(
                                //               'Something went Wrong R-enter your data')),
                                //     );
                                //   }
                                // },
                              )),
                        ],
                      )))),
        ));
  }
}

