import 'package:easypark/screens/upload-file-W.dart';
import 'package:flutter/material.dart';

import 'upload-file-WS.dart';

class TestSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose one of those tests',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => uploadFileW()),
                );
              },
              child: Text('Spiral Test'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => uploadFileWS()),
                );
              },
              child: Text('Wave Test'),
            ),
          ],
        ),
      ),
    );
  }
}
