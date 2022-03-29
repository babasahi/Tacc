import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                height: 22,
                width: 12,
                decoration: BoxDecoration(
                  color: Colors.yellowAccent.withOpacity(0.4),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Text('Play Now !'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
