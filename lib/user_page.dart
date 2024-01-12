import 'package:dermarasa/about_us_page.dart';
import 'package:dermarasa/edit_profile_page.dart';
import 'package:dermarasa/isi_saldo_page.dart';
import 'package:dermarasa/pengaturan_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian atas: logo user dan tulisan edit profil
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromARGB(255, 230, 127, 96),
                          width: 2.0,
                        ),
                      ),
                      padding: EdgeInsets.all(6.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile.jpg',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Lavender Arsya',
                      style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 230, 127, 96),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'lavender@gmail.com',
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    IconButton(
                      onPressed: () {
                        // Navigasi ke halaman EditProfilePage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()),
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 230, 127, 96),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bagian saldo, pengaturan, tentang kami, keluar
            Column(
              children: [
                buildListTile(Icons.monetization_on, 'Saldo', 'Rp.1.675.800',
                    () {
                  // Navigasi ke halaman SaldoPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IsiSaldoPage()),
                  );
                }),
                buildListTile(Icons.settings, 'Pengaturan', null, () {
                  // Navigasi ke halaman PengaturanPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PengaturanPage()),
                  );
                }),
                buildListTile(Icons.help, 'Tentang Kami', null, () {
                  // Navigasi ke halaman TentangKamiPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()),
                  );
                }),
                buildListTile(Icons.logout, 'Keluar', null, () {
                  // Tampilkan notifikasi Loading
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 14),
                            Text(
                              'Verifikasi Log Out...',
                              style: GoogleFonts.poppins(fontSize: 12.0),
                            ),
                          ],
                        ),
                      );
                    },
                  );

                  // Setelah beberapa saat, tutup notifikasi Loading
                  // dan kembali ke halaman log in
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/');
                  });
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(
      IconData icon, String title, String? subtitle, VoidCallback? onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 230, 127, 96),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Color.fromARGB(255, 230, 127, 96),
        ),
        title: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color.fromARGB(255, 230, 127, 96),
              ),
            ),
            const SizedBox(width: 75.0), // Spacer
            if (subtitle != null)
              Text(subtitle, style: TextStyle(color: Colors.grey)),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

// Tambahkan import halaman-halaman baru
//import 'edit_profile_page.dart';
//import 'saldo_page.dart';
//import 'pengaturan_page.dart';
//import 'tentang_kami_page.dart';
