import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 127, 96),
        title:
            Text('Tentang Dermarasa', style: GoogleFonts.poppins(fontSize: 20)),
      ),
      body: ListView(
        children: [
          buildHeader(),
          buildSectionTitle('Kisah Kami'),
          buildStory(),
          buildSectionTitle('Misi'),
          buildMission(),
          buildSectionTitle('Visi'),
          buildVision(),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Color.fromARGB(
            255, 230, 127, 96), // Sesuaikan dengan warna dermarasa
      ),
      child: Center(
        child: Text(
          'Dermarasa',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[200], // Sesuaikan dengan warna latar Gojek
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildStory() {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Dermarasa adalah platform donasi online yang menghubungkan para donatur dengan berbagai penyebab yang mereka pedulikan. '
          'Tujuan kami adalah membuat proses berdonasi menjadi mudah, transparan, dan berdampak besar. '
          'Bergabunglah bersama kami untuk menciptakan perubahan positif di dunia.',
          style: GoogleFonts.poppins(fontSize: 16),
        ),
      ),
    );
  }

  Widget buildMission() {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Misi kami adalah memberdayakan individu dan organisasi untuk berkontribusi pada penyebab yang bermakna. '
          'Kami berusaha menyediakan platform yang mudah dan aman untuk memberikan dampak positif pada masyarakat.',
          style: GoogleFonts.poppins(fontSize: 16),
        ),
      ),
    );
  }

  Widget buildVision() {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Visi kami adalah menciptakan dunia di mana setiap orang memiliki kesempatan untuk mendukung penyebab yang mereka yakini. '
          'Kami membayangkan masa depan di mana kasih sayang dan kebaikan hati menghasilkan perubahan yang langgeng dan dunia yang lebih baik untuk semua.',
          style: GoogleFonts.poppins(fontSize: 16),
        ),
      ),
    );
  }
}
