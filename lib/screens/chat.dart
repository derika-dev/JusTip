import 'package:flutter/material.dart';
import 'package:flutter_justip/screens/pembayaran.dart';
import 'package:flutter_justip/screens/user_page.dart';

void main() {
  runApp(const Chat());
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC107), // Yellow color for app bar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BerandaUser()),
            );
          },
        ),
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile1.png'), // Ganti dengan gambar user
            ),
            SizedBox(width: 10),
            Text(
              'Kang Haerin',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                buildReceivedMessage('Masih butuh penggaris?', 'Hari ini'),
                buildSentMessage('masih bth cepet'),
                buildReceivedMessage('itu aja atau ada yang lain?', ''),
                buildSentMessage('sama pensil dong'),
                buildSentMessage('tapi gatau harga nya berapa'),
                buildReceivedMessage('perkiraan 25k + ongkir 5k gimana?', ''),
                buildSentMessage('oke tapi cepet yaa...'),
                buildReceivedMessage('Pesanan dibuat!', ''),
              ],
            ),
          ),
          buildInputArea(context), // Pass context here
        ],
      ),
    );
  }

  Widget buildReceivedMessage(String message, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (date.isNotEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                date,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile1.png'),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(message),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSentMessage(String message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFC107), // Warna kuning untuk chat terkirim
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(message, softWrap: true),
          ),
        ),
        const SizedBox(width: 10),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile2.png'),
        ),
      ],
    );
  }

  Widget buildInputArea(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.grey[300],
      child: Row(
        children: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.add, color: Colors.yellow[700]), // Tanda plus
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.shopping_bag),
                  title: const Text('Pesanan'),
                  onTap: () {
                    Navigator.pop(context); // Tutup popup terlebih dahulu
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PembayaranPage()), // Navigasi ke halaman pembayaran
                    );
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Maps'),
                  onTap: () {
                    Navigator.pop(context);
                    // Tambahkan fungsionalitas Maps
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text('Media'),
                  onTap: () {
                    Navigator.pop(context);
                    // Tambahkan fungsionalitas Media
                  },
                ),
              ),
            ],
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: "Start typing...",
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.yellow[700]),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
