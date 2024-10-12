import 'package:flutter/material.dart';
import 'package:flutter_justip/screens/chat.dart';
import 'package:flutter_justip/screens/driver_page.dart';
import 'package:flutter_justip/screens/pembayaran.dart';
import 'package:flutter_justip/screens/pilih_lokasi.dart';
import 'package:flutter_justip/screens/posting.dart';
import 'package:flutter_justip/screens/splash.dart';
import 'package:flutter_justip/screens/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/beranda',
      routes: {
        '/chat': (context) => Chat(),
        '/splash': (context) => const Splash(),
        '/user_page': (context) => const BerandaUser(),
        '/driver_page': (context) => const DriverPage(),
        '/posting': (context) => const Posting(),
        '/pembayaran': (context) => const Pembayaran(),
        '/pilih_lokasi': (context) => const PilihLokasiPage(),
      },
    );
  }
}
