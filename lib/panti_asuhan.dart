import 'package:dermarasa/donasi_page.dart';
import 'package:dermarasa/message_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';

class PantiAsuhanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Panti Asuhan An-nur',
          style: GoogleFonts.poppins(fontSize: 20.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/slider11.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Panti Asuhan An-nur',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Tambahkan grafik presentase pembangunan masjid di sini
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp4.243.675,-',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Color.fromARGB(255, 230, 127, 96),
                        ),
                      ),
                      Text(
                        '-14\nHari Lagi',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  LinearProgressIndicator(
                    value:
                        0.3, // Adjust the value based on your progress (0.0 to 1.0)
                    color: Color.fromARGB(
                        255, 230, 92, 50), // Adjust color as needed
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Penggalangan Dana',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/dermarasa_logo.png',
                          width: 35,
                          height: 35,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Conforma Berbagi',
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.verified,
                        size: 20,
                        color: Color.fromARGB(255, 230, 127, 96),
                      ),
                      SizedBox(width: 50),
                      IconButton(
                        icon: Icon(FeatherIcons.messageCircle,
                            size: 25, color: Color.fromARGB(255, 230, 127, 96)),
                        onPressed: () {
                          // Tambahkan logika untuk mengarahkan ke message_page.dart
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MessagePage(
                                      title: 'Panti Asuhan An-nur',
                                    )),
                          );
                          Text('Chat with Masjid Barokah',
                              style: GoogleFonts.poppins());
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Cerita Penggalangan Dana\n"Jalinan Baik: Ajakan Donasi untuk Panti Asuhan An-nur"',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Di kota kecil kami, Panti Asuhan An-nur menjadi tempat tumbuh kembang bagi anak-anak yatim dan dhuafa. Impian kami adalah memberikan mereka lingkungan yang aman, bahagia, dan penuh kasih sayang.\n\n'
                    'Dengan tagar #BersamaAnakHebat, kami mengajak Anda untuk menjadi bagian dari perjalanan baik ini. Barang-barang sumbangan dan hasil penjualan di pasar amal akan disalurkan untuk memenuhi kebutuhan sehari-hari anak-anak.\n\n'
                    'Donasi Anda memiliki dampak besar. Mari bersama-sama menciptakan masa depan yang cerah bagi anak-anak Panti Asuhan An-nur.',
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DonasiPage()),
                      );
                      // Tambahkan logika untuk menangani tombol donasi
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 230, 127, 96),
                      onPrimary: Colors.white,
                    ),
                    child: Text('Donasi Sekarang',
                        style: GoogleFonts.poppins(fontSize: 12)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
