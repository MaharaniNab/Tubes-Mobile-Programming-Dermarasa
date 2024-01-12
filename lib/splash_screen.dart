import 'dart:async';
import 'package:flutter/material.dart';
import 'screen_break.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan telah diinisialisasi
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _logoOpacity = 0.0;
  double _textOpacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Munculkan logo secara perlahan selama 3 detik
    Timer(Duration(seconds: 1), () {
      setState(() {
        _logoOpacity = 1.0;
      });
    });

    // Munculkan tulisan secara perlahan setelah 3 detik
    Timer(Duration(seconds: 4), () {
      setState(() {
        _textOpacity = 1.0;
      });
    });

    // Pindah ke halaman berikutnya setelah 5 detik
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ScreenBreak()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Dermarasa dengan efek muncul secara perlahan
            AnimatedOpacity(
              opacity: _logoOpacity,
              duration: Duration(seconds: 2),
              child: Image.asset('assets/dermarasa_logo.png',
                  width: 130, height: 130),
            ),
            SizedBox(height: 0),
            // Tulisan "DERMARASA" dengan efek muncul secara perlahan
            AnimatedOpacity(
              opacity: _textOpacity,
              duration: Duration(seconds: 2),
              child: Text(
                'DERMARASA',
                style: GoogleFonts.salsa(
                  color: const Color.fromRGBO(144, 64, 39, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
