import 'package:flutter/material.dart';
import 'package:flutter_justip/screens/pilih_lokasi.dart';

void main() {
  runApp(const Pembayaran());
}

class Pembayaran extends StatelessWidget {
  const Pembayaran({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Nonaktifkan banner debug
      home: PembayaranPage(),
    );
  }
}

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({super.key});

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  String selectedPaymentMethod = ''; // Menyimpan metode pembayaran yang dipilih
  bool showPaymentOptions = false; // Status untuk menampilkan atau menyembunyikan opsi pembayaran

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya
          },
        ),
        title: const Text(
          'Pembayaran',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white, // Set warna latar belakang menjadi putih
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Alamat Pengantaran
            const Text(
              'Alamat pengantaran',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Kos Margoyoso',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 0,
                    side: const BorderSide(color: Colors.yellow, width: 2),
                  ),
                  onPressed: () {
                    // Navigasi ke halaman Pilih Lokasi
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PilihLokasiPage()),
                    );
                  },
                  child: const Text('Ganti alamat'),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Teks peringatan dibungkus dalam batas merah
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Row(
                children: [
                  Icon(Icons.warning, color: Colors.red, size: 18),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      'Isi detail alamat biar driver gampang cari lokasimu pas antar pesananmu.',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Detail Alamat & Catatan Buttons di sebelah kiri
            Row(
              mainAxisAlignment: MainAxisAlignment.start, // Align ke kiri
              children: [
                SizedBox(
                  width: 155, // Lebar lebih kecil
                  height: 35, // Tinggi lebih kecil
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.location_on_outlined, size: 16),
                    label: const Text('Isi detail alamat', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 120, // Lebar lebih kecil
                  height: 35, // Tinggi lebih kecil
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.edit_note_outlined, size: 16),
                    label: const Text('Catatan', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Ringkasan Pembayaran
            const Text(
              'Ringkasan pembayaran',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Harga'),
                      Text('25.000'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Biaya Penanganan dan Pengiriman'),
                      Text('5.000'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Biaya lainnya'),
                      Text('2.000'),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total pembayaran',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '32.000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Metode Pembayaran Section
            GestureDetector(
              onTap: () {
                setState(() {
                  showPaymentOptions = !showPaymentOptions; // Toggle visibility
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.attach_money, size: 24), // Ikon dollar
                      SizedBox(width: 8),
                      Text(
                        'Metode pembayaran',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(showPaymentOptions ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down), // Arrow up/down
                ],
              ),
            ),

            // Opsi Pembayaran
            if (showPaymentOptions) ...[
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'QRIS';
                  });
                },
                child: ListTile(
                  title: const Text('QRIS'),
                  trailing: selectedPaymentMethod == 'QRIS'
                      ? const Icon(Icons.check, color: Colors.yellow)
                      : null,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'COD';
                  });
                },
                child: ListTile(
                  title: const Text('COD'),
                  trailing: selectedPaymentMethod == 'COD'
                      ? const Icon(Icons.check, color: Colors.yellow)
                      : null,
                ),
              ),
            ],

            const SizedBox(height: 16),

            // Syarat dan Ketentuan
            Row(
              children: [
                const Icon(Icons.article_outlined, size: 24), // Ikon dokumen
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(text: 'Dengan melanjutkan, Saya setuju dengan Syarat dan Ketentuan yang berlaku. '),
                        TextSpan(
                          text: 'Syarat dan Ketentuan',
                          style: TextStyle(color: Colors.blue), // Teks biru untuk link
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Pembatas setelah teks 'Dengan melanjutkan...'
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0), // Pastikan membentang ke tepi layar
              child: const Divider(
                height: 20, 
                thickness: 1, 
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),

            // Total Pembayaran
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Pembayaran',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'Rp32.000',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),

            // Spacer sebelum tombol
            const Spacer(),

            // Pesan dan Antar Sekarang Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: () {
                  // Aksi ketika tombol "Pesan dan Antar Sekarang" ditekan
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Pesanan berhasil dibuat!'),
                        content: const Text('Pesanan Anda sedang diproses dan akan segera diantar.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Menutup dialog
                            },
                            child: const Text('Tutup'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Pesan dan Antar Sekarang', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
