import 'package:dermarasa/donasi_page.dart';
import 'package:dermarasa/message_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';

class KBSISemarangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KBSI Semarang',
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
                  image: AssetImage('assets/slider13.jpg'),
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
                    'KBSI Semarang',
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
                        'Rp37.243.500,-',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Color.fromARGB(255, 230, 127, 96),
                        ),
                      ),
                      Text(
                        '-3\nHari Lagi',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  LinearProgressIndicator(
                    value:
                        0.8, // Adjust the value based on your progress (0.0 to 1.0)
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
                                builder: (context) =>
                                    MessagePage(title: 'KBSI Semarang')),
                          );
                          Text('Chat with Masjid Barokah',
                              style: GoogleFonts.poppins());
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Cerita Penggalangan Dana\n"Jalinan Baik: Ajakan Donasi untuk KBSI Semarang"',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Komunitas KBSI Semarang aktif dalam kegiatan sosial dan pendidikan. Untuk mewujudkan berbagai program, kami membutuhkan dukungan dari Anda.\n\n'
                    'Dengan tagar #KBSIBerbagi, kami mengajak Anda menjadi bagian dari aksi kebaikan ini. Donasi Anda akan digunakan untuk mendukung kegiatan sosial, pelatihan, dan pengembangan komunitas.\n\n'
                    'Mari bersama-sama menjadikan KBSI Semarang sebagai wadah bagi kebaikan dan kolaborasi.',
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
