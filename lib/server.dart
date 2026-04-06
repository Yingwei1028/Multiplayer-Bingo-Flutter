import 'dart:convert';
import 'dart:io';

const hostname = '0.0.0.0'; // 绑定到所有适配器
const port = 8000;

void main() {
  startServer();
}

Future<void> startServer() async {
  final server = await ServerSocket.bind(hostname, port);
  print('TCP server started at ${server.address}:${server.port}.');

  int clientId = 0;
  final Map<int, Socket> clients = {}; // 存储客户端Socket

  server.listen((Socket client) {
    clientId++;
    final clientIdString = 'Client_$clientId';
    print('Client connected: $clientIdString');

    // 将客户端Socket存储到Map中，使用客户端ID作为键
    clients[clientId] = client;

    client.listen((List<int> data) {
      final message = utf8.decode(data).trim();
      print('Message from $clientIdString: $message');

      if (client == clients[1]) {
        for (var id in clients.keys) {
          if (clients[id] != clients[1]) {
            final otherClient = clients[id];
            otherClient?.write(message);
          }
        }
      }
      if (client != clients[1]) {
        final otherClient = clients[1];
        otherClient?.write(message);
      }
    }, onError: (error) {
      print('Error from $clientIdString: $error');
      client.close();
      clients.remove(clientId); // 从Map中移除断开连接的客户端
    }, onDone: () {
      print('Client disconnected: $clientIdString');
      clients.remove(clientId);
      clientId--; // 从Map中移除断开连接的客户端
    });
  });
}
