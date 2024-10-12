import 'package:flutter/material.dart';
import 'package:flutter_justip/screens/chat.dart';
import 'driver_page.dart'; // Import file driver_page.dart

void main() {
  runApp(const BerandaUser());
}

class BerandaUser extends StatelessWidget {
  const BerandaUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

  @override
  class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 16.0),
              child: CircleAvatar(
                backgroundColor: Colors.yellow[600],
                radius: 20,
                child: IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: Container(
              color: Colors.amber,
              child: const TabBar(
                indicator: BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 224),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                indicatorPadding:
                    EdgeInsets.symmetric(horizontal: -50, vertical: -1),
                tabs: [
                  Tab(
                    child: Text(
                      'Driver',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'User',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            DriverPage(), // Halaman Driver dipanggil dari file driver_page.dart
            UserPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.yellow[700],
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            // Aksi ketika tombol ditekan, misalnya membuka halaman baru untuk membuat postingan
          },
          shape: const CircleBorder(), 
          child: Image.asset(
            'assets/images/vector_posting.png', // Path gambar pensil yang telah kamu upload
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
    }
  }

// Definisi UserPage tetap sama
class UserPage extends StatelessWidget {
  const UserPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // Ubah warna latar belakang di sini
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          PostCard(
            name: "Hanni Pham",
            time: "1 menit yang lalu",
            message:
                "Guys... ada yang lagi di daerah Sirojudin ga?? mau nitip penggaris di aninda dong.. butuh cepet...",
            price: null,
          ),
          PostCard(
            name: "Hanni Pham",
            time: "1 menit yang lalu",
            message:
                "Guys... ada yang lagi di daerah Sirojudin ga?? mau nitip penggaris di aninda dong.. butuh cepet...",
            price: null,
          ),
          PostCard(
            name: "Hanni Pham",
            time: "1 menit yang lalu",
            message:
                "Guys... ada yang lagi di daerah Sirojudin ga?? mau nitip penggaris di aninda dong.. butuh cepet...",
            price: null,
          ),
          PostCard(
            name: "Kim Minji",
            time: "10 menit yang lalu",
            message:
                "lagi pengen mie ayam deket warteg di daerah banjarsari...",
            price: "Rp 15.000",
          ),
        ],
      ),
    );
  }
}


class PostCard extends StatelessWidget {
  final String name;
  final String time;
  final String message;
  final String? price;

  const PostCard({
    super.key,
    required this.name,
    required this.time,
    required this.message,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255), // Ganti warna latar belakang di sini
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/profile1.png'), // Ganti dengan gambar user
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(time, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const SizedBox(height: 10),
            Text(message),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (price != null)
                  Text(price!,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Row(
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.check, color: Colors.black),
                      label: const Text('Gass',
                          style: TextStyle(color: Colors.black)),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()), // Navigasi ke ChatPage
                      );
                    },
                    icon: Image.asset(
                      'assets/images/vector_chat.png', // Ikon chat
                      width: 24,
                      height: 24,
                    ),
                    label: const Text('Chat', style: TextStyle(color: Colors.black)),
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
