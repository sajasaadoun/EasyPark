import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Instructions'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/SLogo.drawio.jpg',
            height: 150,
            width: 150,
          ),
          SizedBox(height: 16),
          Text('Step 1: Draw the Spiral as given. '),
          Text('Step 2: Press Submit.'),
          Text('Step 3: Finally, Check for the results.'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
