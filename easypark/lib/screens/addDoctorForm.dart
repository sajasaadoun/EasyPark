// ignore_for_file: prefer_const_constructors

import 'package:easypark/model/doctorModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DoctorForm extends StatefulWidget {
  const DoctorForm({Key? key}) : super(key: key);

  @override
  State<DoctorForm> createState() => _DoctorFormState();
}

final formkey = GlobalKey<FormState>();

class _DoctorFormState extends State<DoctorForm> {
  final doctorsData = DoctorModel();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController firstNameControllerAr = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController lastNameControllerAr = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController locationControllerAr = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController cityControllerAr = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  // List of Egyptian cities
  final List<String> cities = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Shubra El-Kheima',
    'Port Said',
    'Suez',
    'Luxor',
    'Mansoura',
    'El-Mahalla El-Kubra',
    'Tanta',
    'Asyut',
    'Ismailia',
    'Faiyum',
    'Zagazig',
    'Damietta',
    'Aswan',
    'Minya',
    'Damanhur',
    'Beni Suef',
    'Hurghada'
  ];

  final List<String> citiesAr = [
    'القاهرة',
    'الاسكندرية',
    'الجيزة',
    'شبرا الخيمة',
    'بورسعيد',
    'السويس',
    'الاقصر',
    'المنصورة',
    'المحلة الكبرى',
    'طنطا',
    'أسيوط',
    'اسماعيلية',
    'فيوم',
    'زقازيق',
    'دمياط',
    'أسوان',
    'المنيا',
    'دمنهور',
    'بني سويف',
    'الغردقة'
  ];
  // Selected city
  String? selectedCity;
  String? selectedCityAr;
  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            style:
                TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
            'Add A New doctor to your app',
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
                                controller: firstNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Doctor First Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
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
                                controller: firstNameControllerAr,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Doctor First Name in Arabic',
                                ),
                                validator: (value) {
                                  // if (value!.isEmpty ||
                                  //     !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                  //   return "enter a correct name";
                                  // } else {
                                  //   return null;
                                  // }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: lastNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Doctor Last Name ',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
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
                                controller: lastNameControllerAr,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Doctor Last Name in Arabic',
                                ),
                                validator: (value) {
                                  // if (value!.isEmpty ||
                                  //     !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                  //   return "enter a correct name";
                                  // } else {
                                  //   return null;
                                  // }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: DropdownButtonFormField<String>(
                              value: selectedCity,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Doctor\'s City',
                              ),
                              items: cities.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedCity = newValue;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select a city';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: DropdownButtonFormField<String>(
                              value: selectedCityAr,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Doctor\'s City in Arabic',
                              ),
                              items: citiesAr.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedCityAr = newValue;
                                });
                              },
                              validator: (value) {
                                // if (value == null) {
                                //   return 'Please select a city';
                                // } else {
                                //   return null;
                                // }
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: locationController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Doctor\'s Location',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp('^[a-zA-Z0-9 ]+\$')
                                          .hasMatch(value)) {
                                    return "enter a correct city";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: locationControllerAr,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Doctor\'s Location in Arabic',
                                ),
                                validator: (value) {
                                  // if (value!.isEmpty ||
                                  //     !RegExp('^[a-zA-Z0-9 ]+\$')
                                  //         .hasMatch(value)) {
                                  //   return "enter a correct city";
                                  // } else {
                                  //   return null;
                                  // }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: emailController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Doctor\'s Email',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                          .hasMatch(value)) {
                                    return "enter a correct email";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: phoneNumberController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Doctor\'s Phone Number',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a correct phone number';
                                  } else if (!RegExp(r'^01[0-9]{9}$')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid 11-digit phone number';
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
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  try {
                                    await doctorsData.doctorAdded(
                                      name: firstNameController.text +
                                          ' ' +
                                          lastNameController.text,
                                      nameAr: firstNameControllerAr.text +
                                          ' ' +
                                          lastNameControllerAr.text,
                                      city: selectedCity.toString(),
                                      cityAr: selectedCityAr.toString(),
                                      email: emailController.text,
                                      phonenumber: phoneNumberController.text,
                                      location: locationController.text,
                                      locationAr: locationControllerAr.text,
                                      description: '',
                                      descriptionAr: '',
                                      password: '',
                                      price: '',
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Successfully Added')),
                                    );
                                    Navigator.pushNamed(context, 'admin');
                                  } catch (error) {
                                    print(
                                        'Error: $error'); // Print the error in the terminal
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Something went wrong. Please try again.'),
                                      ),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Please correct the errors in the form.'),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      )))),
        ));
  }
}
