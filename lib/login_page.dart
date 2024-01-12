import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:dermarasa/register_page.dart';
import 'package:dermarasa/home_page.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Daftar email yang sudah terdaftar
  final List<String> registeredEmails = [
    'maharani@gmail.com',
    'kim.hana@gmail.com',
    'lavender@gmail.com',
  ];

  // Email yang dipilih saat login dengan akun Google
  String? _selectedGoogleEmail;

  bool _isVerifying =
      false; // Tambahkan variabel untuk menentukan apakah sedang memverifikasi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold), // Ganti font menjadi poppins
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(FeatherIcons.logIn, size: 20.0),
                labelText: 'Email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0)),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(FeatherIcons.lock, size: 20.0),
                labelText: 'Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Tambahkan logika untuk lupa kata sandi
                  },
                  child: Text(
                    'Lupa Sandi?',
                    style: GoogleFonts.poppins(
                        fontSize: 14), // Ganti font pada teks lupa sandi
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika untuk proses login
                    if (_validateLogin()) {
                      _verifyEmail(); // Panggil fungsi untuk memverifikasi email secara manual
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 211, 73, 31),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: _isVerifying
                      ? CircularProgressIndicator() // Tampilkan loading jika sedang memverifikasi
                      : Text(
                          'Masuk',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color:
                                  Colors.white), // Ganti font pada teks tombol
                        ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Masuk dengan akun Google',
                  style:
                      GoogleFonts.poppins(fontSize: 14), // Ganti font pada teks
                ),
                IconButton(
                  icon: Icon(Icons.account_circle_outlined),
                  onPressed: () {
                    // Tampilkan dialog dengan pilihan email
                    _showGoogleLoginDialog(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tidak memiliki akun?',
                  style:
                      GoogleFonts.poppins(fontSize: 14), // Ganti font pada teks
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    'Daftar',
                    style: GoogleFonts.poppins(
                        fontSize: 14), // Ganti font pada teks
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _validateLogin() {
    String email = _emailController.text.trim().toLowerCase();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog(context, 'Email dan Password harus diisi.');
      return false;
    }

    if (!email.endsWith('@gmail.com')) {
      _showErrorDialog(context, 'Email harus sesuai format.');
      return false;
    }

    if (password.length < 8 ||
        !RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,}$').hasMatch(password)) {
      _showErrorDialog(context,
          'Password harus terdiri dari minimal 8 karakter dengan campuran huruf dan angka.');
      return false;
    }

    if (!registeredEmails.contains(email)) {
      _showErrorDialog(context, 'Email tidak terdaftar.');
      return false;
    }

    return true;
  }

  void _verifyEmail() {
    setState(() {
      _isVerifying = true;
    });

    // Lakukan verifikasi email (menggunakan contoh durasi 3 detik)
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isVerifying = false;
      });

      // Tampilkan dialog hasil verifikasi
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Verifikasi Berhasil'),
            content: Text('Email berhasil diverifikasi.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showGoogleLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pilih Email'),
          content: Column(
            children: [
              for (String email in registeredEmails)
                ListTile(
                  title: Container(
                    padding: EdgeInsets.only(right: 0),
                    child: Row(
                      children: [
                        Icon(Icons.account_circle_outlined, size: 20),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            email,
                            style: GoogleFonts.poppins(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedGoogleEmail = email;
                    });
                    Navigator.pop(context);
                    if (_selectedGoogleEmail != null) {
                      _processGoogleLogin();
                    }
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  void _processGoogleLogin() {
    // Tampilkan loading
    showDialog(
      context: context,
      barrierDismissible:
          false, // Menghilangkan kemampuan menutup dialog dengan tap di luar dialog
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 14),
              Text(
                'Verifikasi Email...',
                style: GoogleFonts.poppins(fontSize: 12.0),
              ),
            ],
          ),
        );
      },
    );

    // Lakukan verifikasi email (menggunakan contoh durasi 3 detik)
    Future.delayed(Duration(seconds: 3), () {
      // Tutup dialog loading
      Navigator.pop(context);

      // Lanjutkan ke HomePage setelah verifikasi selesai
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }
}
