import 'package:flutter/material.dart';
import 'package:easypark/model/user.dart';
import 'package:easypark/utils/user_preferences.dart';
import 'package:easypark/widgets/appbar_widget.dart';
import 'package:easypark/widgets/profile_widget.dart';
import 'package:easypark/widgets/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                isEdit: true,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              TextFormField(
                initialValue: user.name,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),
              TextFormField(
                initialValue: user.email,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),
              TextFormField(
                initialValue: '11',
                decoration: InputDecoration(
                  labelText: 'password',
                ),
                validator: (initialValue) {
                  if (initialValue == null || initialValue.isEmpty) {
                    print('Please enter your password');
                  } else if (initialValue.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),
              TextFormField(
                initialValue: user.age.toString(),
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),
              TextFormField(
                initialValue: "0111111111",
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      );
}
