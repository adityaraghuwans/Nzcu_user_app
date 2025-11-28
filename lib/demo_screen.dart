import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Demo Screen"),
            SizedBox(
              width: w * .3,
              height: w * .08,
              child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
