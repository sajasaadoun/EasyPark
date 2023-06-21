import 'package:flutter/material.dart';

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
                // Handle Spiral Test button press
                // Navigate to the Spiral Test screen
              },
              child: Text('Spiral Test'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle Wave Test button press
                // Navigate to the Wave Test screen
              },
              child: Text('Wave Test'),
            ),
          ],
        ),
      ),
    );
  }
}
