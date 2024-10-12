// driver_page.dart
import 'package:flutter/material.dart';

class DriverPage extends StatelessWidget {
  const DriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: const [
        Center(
          child: Text('Halaman Driver'),
        ),
      ],
    );
  }
}
