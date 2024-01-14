import 'package:dermarasa/user_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PengaturanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 127, 96),
        title: Text(
          'Pengaturan',
          style: GoogleFonts.poppins(fontSize: 20.0),
        ),
      ),
      body: ListView(
        children: [
          buildSectionTitle('Info Akun'),
          buildSettingItem('Pembayaran', Icons.credit_card),
          buildSettingItem('Keamanan', Icons.security),
          buildSettingItem('Pusat Bantuan', Icons.help_outline),
          SizedBox(height: 16),
          buildSectionTitle('Pengaturan Lainnya'),
          buildSettingItem('Notifikasi', Icons.notifications),
          buildSettingItem('Privasi', Icons.privacy_tip),
          buildSettingItem('Bahasa', Icons.language),
          SizedBox(height: 16),
          buildSectionTitle('Aplikasi'),
          buildSettingItem('Versi Aplikasi', Icons.info),
          SizedBox(height: 16),
          buildSaveButton(context),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildSettingItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color.fromARGB(255, 230, 127, 96),
      ),
      title: Text(title, style: GoogleFonts.poppins(fontSize: 14)),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        // Tambahkan logika untuk menghandle ketika item di tap
      },
    );
  }

  Widget buildSaveButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Tambahkan logika untuk menghandle simpan

          // Setelah melakukan penyimpanan, arahkan ke halaman UserPage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 230, 127, 96),
          onPrimary: Colors.white,
        ),
        child: Text('Simpan', style: GoogleFonts.poppins()),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
    );
  }
}
