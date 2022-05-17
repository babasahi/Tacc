import 'package:flutter/material.dart';

class ReturnIcon extends StatelessWidget {
  const ReturnIcon({Key? key, required this.destination}) : super(key: key);
  final Widget destination;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.arrow_back,
        size: 30,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
    );
  }
}
