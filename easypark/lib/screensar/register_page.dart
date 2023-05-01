import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildFirstName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'First Name',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              hintText: 'First Name',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildLastName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Last Name',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              hintText: 'Last Name',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildphone() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Phone Number',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.blue,
              ),
              hintText: 'Phone Number',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildAge() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Birthdate',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.date_range,
                color: Colors.blue,
              ),
              hintText: 'Birthdate',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Password',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        height: 60,
        child: TextField(
          obscureText: true,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildLoginBtn(context) {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title:
                        const Text('سياسة خصوصية المستخدم واستخدام البيانات'),
                    content: const Text(
                        'تم تصميم تطبيق الهاتف المحمول الخاص بنا لاكتشاف مرض باركنسون ومتابعته ("EasyPark") لمساعدة المستخدمين على إدارة صحتهم وعافيتهم. بصفتنا مقدمًا لتطبيق طبي ، فإننا نأخذ خصوصية المستخدم واستخدام البيانات على محمل الجد. توضح هذه السياسة كيفية جمع بيانات المستخدم وتخزينها واستخدامها.\nسياسة خصوصية المستخدم واستخدام البيانات: نقوم بجمع المعلومات الشخصية والصحية لتقديم توصيات صحية ، وتحسين التطبيق ، والتواصل مع المستخدمين. نحن لا نشارك بيانات المستخدم إلا بموافقة أو لأسباب بحثية. نحمي بيانات المستخدم بالتشفير والمراقبة. يمكن للمستخدمين الوصول إلى بياناتهم أو تعديلها أو حذفها.'),
                    actions: [
                      TextButton(
                        child: const Text('Agreed'),
                        onPressed: () {},
                      ),
                    ],
                  ));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 10, fontStyle: FontStyle.normal),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ));
}

Widget buildSignBtn() {
  return GestureDetector(
    onTap: () => print('Sign Up Pressed'),
    child: RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Already have an Accoun?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          )),
      TextSpan(
          text: ' Sign In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ))
    ])),
  );
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xFFBBDEFB),
                      Color(0xFF90CAF9),
                      Color(0xFF64B5F6),
                      Color(0xFF42A5F5),
                      Color(0xFF1E88E5),
                      Color(0xFF1976D2),
                    ])),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      buildFirstName(),
                      const SizedBox(
                        height: 10,
                      ),
                      buildLastName(),
                      const SizedBox(
                        height: 10,
                      ),
                      buildEmail(),
                      const SizedBox(
                        height: 10,
                      ),
                      buildphone(),
                      const SizedBox(
                        height: 10,
                      ),
                      buildAge(),
                      const SizedBox(
                        height: 10,
                      ),
                      buildPassword(),
                      const SizedBox(
                        height: 30,
                      ),
                      buildLoginBtn(context),
                      buildSignBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
