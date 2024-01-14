import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dermarasa/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenBreak extends StatefulWidget {
  @override
  _ScreenBreakState createState() => _ScreenBreakState();
}

class _ScreenBreakState extends State<ScreenBreak> {
  int _bgIndex = 0;
  late Timer _timer; // Tambahkan variabel timer

  List<String> bgImages = [
    'assets/bg1.jpg',
    'assets/bg2.jpg', // Ganti dengan path gambar lain jika diperlukan
  ];

  List<String> messages = [
    'Bersama Berbagi,\nBersama Peduli',
    'Setitik Donasi,\nLautan Manfaat',
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          _bgIndex = (_bgIndex + 1) % bgImages.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Batalkan timer saat widget dihapus
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black
                  .withOpacity(0.5), // Sesuaikan tingkat kegelapan di sini
              BlendMode.darken,
            ),
            child: Image.asset(bgImages[_bgIndex], fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 0), // Spacer untuk memberikan ruang atas
                Image.asset(
                  'assets/logo.png',
                  width: 120,
                  height: 120,
                ),
                SizedBox(height: 300),
                Text(
                  messages[
                      _bgIndex], // Menggunakan pesan sesuai dengan indeks gambar latar belakang
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Masuk()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 211, 73, 31),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  ),
                  child: Text(
                    'Mulai Donasi',
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
