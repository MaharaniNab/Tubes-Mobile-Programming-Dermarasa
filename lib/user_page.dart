import 'dart:typed_data';
import 'package:dermarasa/about_us_page.dart';
import 'package:dermarasa/activity_page.dart';
import 'package:dermarasa/buildlist.dart';
import 'package:dermarasa/edit_profile_page.dart';
import 'package:dermarasa/home_page.dart';
import 'package:dermarasa/isi_saldo_page.dart';
import 'package:dermarasa/message_page.dart';
import 'package:dermarasa/pengaturan_page.dart';
import 'package:dermarasa/utils.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? username;
  String? email;
  String? password;
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot<Map<String, dynamic>> userDoc =
            await _firestore.collection('users').doc(user.uid).get();

        setState(() {
          username = userDoc['username'];
          email = userDoc['email'];
          password = userDoc['password'];
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  void selectImage() async {
    List<int>? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      setState(() {
        _image = Uint8List.fromList(img);
      });
    }
  }

  // Function to update user information
  void updateUserInformation(String newUsername, String newEmail) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'username': newUsername,
          'email': newEmail,
        });

        // Fetch updated data
        fetchUserData();
      }
    } catch (e) {
      print('Error updating user information: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 230, 127, 96),
          title: const Center(
            child: Text('Profil'),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : CircleAvatar(
                        radius: 64,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/user.png'),
                      ),
                Positioned(
                  child: IconButton(
                    onPressed: selectImage,
                    icon: Icon(Icons.add_a_photo),
                    color: Color.fromARGB(255, 230, 127, 96),
                  ),
                  bottom: 10,
                  left: 86,
                )
              ],
            ),
            Text(
              '$username',
              style: GoogleFonts.poppins(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 230, 127, 96),
              ),
            ),
            Text(
              '$email',
              style: GoogleFonts.poppins(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileEdit()),
                );

                // Update the UI with the new data if result is not null
                if (result != null) {
                  setState(() {
                    username = result['updatedUsername'];
                    email = result['updatedEmail'];
                  });
                }
              },
              icon: Icon(
                Icons.edit,
                color: Color.fromARGB(255, 230, 127, 96),
              ),
            ),
            Column(
              children: [
                buildListTile(Icons.monetization_on, 'Saldo', 'Rp.17.675.843',
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
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        selectedItemColor:
            Color.fromARGB(255, 230, 127, 96), // Set selected item color
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.activity),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.messageCircle,
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.user,
              color: Color.fromARGB(255, 230, 127, 96), // Ubah warna ikon
            ),
            label: 'User',
          ),
        ],
        onTap: (index) {
          // Change the page according to the selected index
          _onBottomNavigationBarTap(context, index);
        },
      ),
    );
  }

  // Function to show the edit dialog
  Future<void> showEditDialog(BuildContext context) async {
    TextEditingController usernameController =
        TextEditingController(text: username);
    TextEditingController emailController = TextEditingController(text: email);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileEdit()),
                );

                // Update the UI with the new data if result is not null
                if (result != null) {
                  setState(() {
                    username = result['updatedUsername'];
                    email = result['updatedEmail'];
                  });
                }
              },
              icon: Icon(
                Icons.edit,
                color: Color.fromARGB(255, 230, 127, 96),
              ),
            ),
          ],
        );
      },
    );
  }
}

// Function to handle bottom navigation bar taps
void _onBottomNavigationBarTap(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      break;
    case 1:
      // Activity Page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ActivityPage()),
      );
      break;
    case 2:
      // Message Page
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MessagePage(
                  title: '',
                )),
      );
      break;
    case 3:
      // User Page
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ProfilePage()),
      // );
      break;
  }
}
