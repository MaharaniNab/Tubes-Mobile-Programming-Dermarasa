import 'package:dermarasa/home_page.dart';
import 'package:dermarasa/register_page.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'autservices.dart';

class Masuk extends StatefulWidget {
  @override
  _Masuk createState() => _Masuk();
}

class _Masuk extends State<Masuk> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController =
      TextEditingController(); // Add this line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Masuk',
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Email'),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    hintText: "Masukkan Email atau Username",
                    fillColor: Colors.white70,
                    // labelText: 'Email',
                    prefixIcon: Icon(FeatherIcons.logIn, size: 20.0),
                  ),
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password'),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    hintText: "Masukkan Password",
                    fillColor: Colors.white70,
                    // labelText: 'Email',
                    prefixIcon: Icon(FeatherIcons.lock, size: 20.0),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      final String email = emailController.text.trim();
                      final String password = passwordController.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        print("Email dan Password tidak boleh kosong");
                      } else {
                        // Call the login function from AuthManager
                        User? user =
                            await context.read<AuthManager>().loginUser(
                                  email,
                                  password,
                                );

                        if (user != null) {
                          print("Login berhasil: ${user.uid}");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                          // Navigate to the home page or any other screen
                        } else {
                          print("Login gagal");
                          // Handle login failure
                        }
                      }
                    },
                    child: Text(
                      'Masuk',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/flat-color-icons_google.svg',
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Masuk dengan Google',
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tidak memiliki akun?',
                      style: GoogleFonts.poppins(
                          fontSize: 14), // Ganti font pada teks
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                      child: Text(
                        'Daftar',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 8),
              ]),
        ),
      ),
    );
  }
}
