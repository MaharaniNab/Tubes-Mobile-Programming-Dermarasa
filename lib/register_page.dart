import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dermarasa/home_page.dart';
import 'package:dermarasa/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'autservices.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  bool _agreeToTerms = false;

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
                'Daftar Akun',
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              buildTextField("Username", Icons.person, usernameController),
              SizedBox(height: 12),
              buildTextField("Email", Icons.email, emailController),
              SizedBox(height: 12),
              buildPasswordField("Password", Icons.lock, passwordController),
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
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextButton(
                  onPressed: () async {
                    final String username = usernameController.text.trim();
                    final String email = emailController.text.trim();
                    final String password = passwordController.text.trim();

                    if (username.isEmpty || email.isEmpty || password.isEmpty) {
                      print("Semua field harus diisi");
                    } else {
                      // Call the sign-up function from AuthManager
                      User? user = await context.read<AuthManager>().signInUser(
                            username,
                            email,
                            password,
                          );

                      if (user != null) {
                        print("Sign up berhasil: ${user.uid}");

                        // Save additional user information to Firestore
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid)
                            .set({
                          'uid': user.uid,
                          'username': username,
                          'email': email,
                          'password': password,
                          // Add other fields as needed
                        });

                        // Navigate to the home page or any other screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      } else {
                        print("Sign up gagal");
                        // Handle sign-up failure
                      }
                    }
                  },
                  child: Text(
                    'Daftar',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah memiliki akun?',
                    style: TextStyle(fontSize: 12),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Masuk(),
                        ),
                      );
                    },
                    child: Text(
                      'Masuk',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, IconData icon, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            hintText: "Masukkan $label",
            fillColor: Colors.white70,
            prefixIcon: Icon(
              icon,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPasswordField(
      String label, IconData icon, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
        ),
        TextFormField(
          obscureText: true,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "Masukkan $label",
            prefixIcon: Icon(icon),
          ),
        ),
      ],
    );
  }
}
