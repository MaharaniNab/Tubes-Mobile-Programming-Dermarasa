import 'package:flutter/material.dart';
import 'package:dermarasa/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _agreeToTerms = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Daftar Akun',
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
              style: GoogleFonts.poppins(fontSize: 10),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
                border: OutlineInputBorder(),
              ),
              style: GoogleFonts.poppins(fontSize: 10),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              style: GoogleFonts.poppins(fontSize: 10),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              style: GoogleFonts.poppins(fontSize: 10),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (bool? value) {
                    setState(() {
                      _agreeToTerms = value ?? false;
                    });
                  },
                ),
                Text(
                  'Setuju dengan Syarat dan Ketentuan',
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_validateFields()) {
                  // Tampilkan loading verifikasi
                  setState(() {
                    _isLoading = true;
                  });

                  // Tambahkan logika untuk proses pendaftaran dan verifikasi
                  await _registerAndVerify();

                  // Sembunyikan loading setelah selesai verifikasi
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 211, 73, 31),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: _isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Text(
                      'Daftar',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sudah memiliki akun?',
                  style: GoogleFonts.poppins(),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Kembali ke halaman login
                  },
                  child: Text(
                    'Masuk',
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _validateFields() {
    if (_nameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      _showErrorDialog('Semua kolom wajib diisi.');
      return false;
    } else if (!_phoneController.text.startsWith('08')) {
      _showErrorDialog('Nomor Telepon harus dimulai dengan 08.');
      return false;
    } else if (!RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9]).{8,}$')
        .hasMatch(_passwordController.text)) {
      _showErrorDialog(
          'Password harus terdiri dari minimal 8 karakter dengan campuran huruf dan angka.');
      return false;
    } else if (!_agreeToTerms) {
      _showErrorDialog('Anda harus setuju dengan Syarat dan Ketentuan.');
      return false;
    } else if (!_isValidUsername()) {
      _showErrorDialog('Email harus sesuai format');
      return false;
    }
    return true;
  }

  bool _isValidUsername() {
    String email = _emailController.text.trim().toLowerCase();
    String username = _nameController.text.trim().toLowerCase();

    if (!email.endsWith('@gmail.com')) {
      return false;
    }

    String expectedUsername = email.substring(0, email.indexOf('@'));
    return username == expectedUsername;
  }

  Future<void> _registerAndVerify() async {
    // Simulasi verifikasi selama 3 detik
    await Future.delayed(Duration(seconds: 3));

    // Tampilkan dialog berhasil register
    _showSuccessDialog();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Berhasil Registrasi'),
          content: Text('Akun berhasil didaftarkan.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Navigasi ke halaman beranda setelah menutup dialog
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
  }

  void _showErrorDialog(String message) {
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
}
