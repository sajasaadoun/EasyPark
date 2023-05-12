import 'package:flutter/material.dart';

class AdminPanellAr extends StatelessWidget {
  const AdminPanellAr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لوحة الادارة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مرحباَ, سجى',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.0),
            Text(
              ' ماذا تريد ان تفعل اليوم؟',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(
                    icon: Icons.add,
                    title: 'اضافة طبيب',
                    onTap: () {
                      Navigator.pushNamed(context, '/ar/form');
                    },
                  ),
                  _buildListTile(
                    icon: Icons.delete,
                    title: 'حذف طبيب',
                    onTap: () {
                      Navigator.pushNamed(context, '/ar/deleteDr');
                    },
                  ),
                  // _buildListTile(
                  //   icon: Icons.add,
                  //   title: 'اضافة مريض',
                  //   onTap: () {
                  //     // TODO: Implement the add patient functionality
                  //   },
                  // ),
                  // _buildListTile(
                  //   icon: Icons.delete,
                  //   title: 'حذف مريض',
                  //   onTap: () {
                  //     // TODO: Implement the delete patient functionality
                  //   },
                  // ),
                  _buildListTile(
                    icon: Icons.edit,
                    title: 'تعديل الاستبيان',
                    onTap: () {
                      Navigator.pushNamed(context, '/ar/insertQuestions');
                    },
                  ),
                  _buildListTile(
                    icon: Icons.edit,
                    title: 'تعديل الصفحة الشخصية',
                    onTap: () {
                      // TODO: Implement the edit profile functionality
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      trailing: Icon(Icons.arrow_forward),
    );
  }
}
