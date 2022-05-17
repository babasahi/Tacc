import 'package:flutter/material.dart';
import 'package:tic_tac_toe/components/common.dart';
import 'package:tic_tac_toe/screens/board_screen.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri linkedin =
    Uri.parse('https://linkedin.com/in/babe-saleh-mahfoud-519b52200/');
final Uri email = Uri.parse(
    'mailto:babesalehmahfoud@gmail.com?subject=Hello%20From%20Tacc&body=New%20plugin');

final Uri portfolio = Uri.parse('https://babe-saleh-mahfoud.github.io');
final Uri telephone = Uri.parse('tel:+222-31048116');

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
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        launch(linkedin);
                      },
                      child: Image(
                          height: 32,
                          width: 32,
                          image: AssetImage('assets/images/linked.png')),
                    ),
                    GestureDetector(
                        onTap: () {
                          launch(portfolio);
                        },
                        child: Icon(
                          Icons.language,
                          size: 32,
                          color: Colors.blue.withOpacity(1),
                        )),
                    GestureDetector(
                      onTap: () => launch(email),
                      child: Icon(
                        Icons.email,
                        size: 32,
                        color: Colors.blue.withOpacity(1),
                      ),
                    ),
                    GestureDetector(
                      onTap: (() => launch(telephone)),
                      child: Icon(
                        Icons.phone,
                        size: 32,
                        color: Colors.blue.withOpacity(1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
