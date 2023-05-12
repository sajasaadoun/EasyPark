import 'package:flutter/material.dart';

class AdminPanell extends StatelessWidget {
  const AdminPanell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'home');
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, Saja',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.0),
            Text(
              ' What would you like to do today?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(
                    icon: Icons.add,
                    title: 'Add Doctor',
                    onTap: () {
                      Navigator.pushNamed(context, 'addDrEng');
                    },
                  ),
                  _buildListTile(
                    icon: Icons.delete,
                    title: 'Delete Doctor',
                    onTap: () {
                     Navigator.pushNamed(context, 'deleteDr');
                    },
                  ),
                  _buildListTile(
                    icon: Icons.edit,
                    title: 'Add A Question',
                    onTap: () {
                        Navigator.pushNamed(context, 'insertQuestions');
                    },
                  ),
                  _buildListTile(
                    icon: Icons.edit,
                    title: 'Edit Profile',
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
