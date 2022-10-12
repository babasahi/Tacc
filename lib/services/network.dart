import 'dart:io';

import '../models/models.dart';

class NetworkConnection {
  Future<Socket> receiveSocket = Socket.connect('', 6789);

  Future<void> sendNewStatus(GameStatus newStatus) async {
    //TODO: implement sending object using sockets;
  }
}
