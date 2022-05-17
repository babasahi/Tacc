import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/common.dart';
import 'package:tic_tac_toe/screens/board_screen.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri linkedin = Uri.parse('https://flutter.dev');
final Uri email = Uri.parse('https://flutter.dev');
final Uri portfolio = Uri.parse('https://flutter.dev');

class WhoAreWe extends StatelessWidget {
  void launch(Uri url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: ReturnIcon(
            destination: GameBoardPage(),
          )),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/saleh.jpg'),
                ),
                SizedBox(height: 12),
                Text(
                  'Babe Saleh Mahfoud',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Contact Me',
                  style: TextStyle(fontFamily: 'Source Sans Pro', fontSize: 32),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        launch(linkedin);
                      },
                      child: Image(
                          height: 22,
                          width: 22,
                          color: Colors.red,
                          image: AssetImage('assets/images/linked.png')),
                    ),
                    GestureDetector(
                        onTap: () {
                          launch(portfolio);
                        },
                        child: Icon(Icons.language)),
                    Icon(Icons.email),
                    Icon(
                      Icons.phone,
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      'All Rights Reserved, Telmidi 2021.',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
