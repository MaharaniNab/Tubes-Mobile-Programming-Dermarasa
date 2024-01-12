import 'package:dermarasa/user_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: GoogleFonts.poppins()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Foto profile
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            const SizedBox(height: 16.0),

            // Nama Pengguna
            _buildTextField(
              label: 'Nama Pengguna',
              controller: _usernameController,
            ),
            const SizedBox(height: 10.0),

            // Email
            _buildTextField(
              label: 'Email',
              controller: _emailController,
            ),
            const SizedBox(height: 10.0),
            // Password
            _buildTextField(
              label: 'Password',
              controller: _passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 10.0),

            // Bio
            _buildTextField(
              label: 'Bio',
              controller: _bioController,
              maxLines: 2,
            ),

            const SizedBox(
              height: 30.0,
            ),

            // Tombol Simpan
            ElevatedButton(
              onPressed: () {
                // Implementasi simpan perubahan
                _saveChanges();
              },
              child: Text('Simpan',
                  style: GoogleFonts.poppins(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 230, 127, 96),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      style: GoogleFonts.poppins(fontSize: 12),
    );
  }

  void _saveChanges() {
    // Implementasi logika penyimpanan perubahan
    String newUsername = _usernameController.text;
    String newEmail = _emailController.text;
    String newPassword = _passwordController.text;
    String newBio = _bioController.text;

    // Lakukan sesuatu dengan data yang baru
    // ...
// Pindah ke halaman UserPage setelah menyimpan
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UserPage()),
    );
    // Tampilkan notifikasi atau pindah ke halaman lain jika perlu
    // ...
  }
}

void main() {
  runApp(MaterialApp(
    home: EditProfilePage(),
  ));
}
