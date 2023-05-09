// ignore_for_file: prefer_const_constructors

import 'package:easypark/model/doctorModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DoctorFormAr extends StatefulWidget {
  const DoctorFormAr({Key? key}) : super(key: key);

  @override
  State<DoctorFormAr> createState() => _DoctorFormState();
}

final formkey = GlobalKey<FormState>();

class _DoctorFormState extends State<DoctorFormAr> {
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

  final List<String> citiesEn = [
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
            'أضف طبيبًا جديدًا إلى تطبيقك',
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/ar/admin');
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
                                'أدخل بيانات الطبيب من فضلك ',
                                style: TextStyle(fontSize: 20),
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: firstNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: ' الاسم الاول بالانجليزي',
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
                                controller: firstNameControllerAr,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: ' الاسم الاول بالعربي',
                                ),
                                validator: (value) {
                                  // if (value!.isEmpty ||
                                  //     !RegExp('[a-zA-Z]').hasMatch(value)) {
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
                                  labelText: ' الاسم الاخير بالانجليزي',
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
                                controller: lastNameControllerAr,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'الاسم الاخير بالعربي',
                                ),
                                validator: (value) {
                                  // if (value!.isEmpty ||
                                  //     !RegExp('[a-zA-Z]').hasMatch(value)) {
                                  //   return "enter a correct description";
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
                                  labelText: ' المدينة بالانجليزي',
                                ),
                                items: citiesEn.map((String value) {
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
                                  if (value!.isEmpty ||
                                      !RegExp('[a-zA-Z]').hasMatch(value)) {
                                    return "enter a city";
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: DropdownButtonFormField<String>(
                                value: selectedCityAr,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'المدينة',
                                ),
                                items: cities.map((String value) {
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
                                  // if (value!.isEmpty ||
                                  //     !RegExp('[a-zA-Z]').hasMatch(value)) {
                                  //   return "enter a city";
                                  // } else {
                                  //   return null;
                                  // }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                                style: TextStyle(color: Colors.black),
                                controller: locationController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'عنوان الدكتور بالنجليزي',
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
                                  labelText: 'عنوان الدكتور بالعربي',
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
                                  labelText: 'البريد الالكتروني',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp('.+@.+\..+').hasMatch(value)) {
                                    return "enter a city";
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
                                  labelText: 'رقم التيلفون',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'الرجاء إدخال رقم هاتف';
                                  } else if (!RegExp(r'^\d{11}$')
                                      .hasMatch(value)) {
                                    return 'الرجاء إدخال رقم هاتف صالح مكون من 10 أرقام';
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
                              child: const Text('قدم',
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
                                          content: Text('أضيف بنجاح')),
                                    );
                                    Navigator.pushNamed(context, '/ar/admin');
                                  } catch (error) {
                                    print(
                                        'Error: $error'); // Print the error in the terminal
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('هناك خطأ ما. حاول مرة اخرى.'),
                                      ),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'يرجى تصحيح الأخطاء في النموذج.'),
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
