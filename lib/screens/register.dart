import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Text("Buat Akun"),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Nama",
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                    obscureText: true,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Konfirmasi Password",
                    ),
                    obscureText: true,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Daftar"),
                  ),
                  const Text("Sudah punya akun? Masuk"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}