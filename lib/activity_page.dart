import 'package:dermarasa/home_page.dart';
import 'package:dermarasa/message_page.dart';
import 'package:dermarasa/user_page.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 230, 127, 96),
        title: const Center(
          child: Text('Riwayat Donasi'),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(18),
        children: [
          _buildTransactionItem(
            imagePath: 'assets/slider10.jpg',
            title: 'Pembangunan Masjid Barokah',
            timestamp: '9 menit lalu',
            amount: 'Rp100.000',
            status: 'Berhasil',
          ),
          _buildTransactionItem(
            imagePath: 'assets/slider12.jpg',
            title: 'Pondok Pesantren Darul Ilmi',
            timestamp: '2 hari lalu',
            amount: 'Rp300.000',
            status: 'Berhasil',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
            icon: Icon(
              FeatherIcons.activity,
              color: Color.fromARGB(255, 230, 127, 96), // Ubah warna ikon
            ),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.messageCircle),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.user),
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
}

Widget _buildTransactionItem({
  required String imagePath,
  required String title,
  required String timestamp,
  required String amount,
  required String status,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 18),
    decoration: BoxDecoration(
      border: Border.all(
        color: Color.fromARGB(255, 230, 127, 96),
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      children: [
        // Gambar slider di sebelah kiri dengan lengkungan
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
          ),
          child: Container(
            width: 90,
            height: 90,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10),
        // Informasi transaksi di sebelah kanan
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              // Row untuk menampilkan timestamp, amount, dan status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    timestamp,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    amount,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Color.fromARGB(255, 230, 127, 96),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 230, 127, 96),
                        width: 0.8,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Text(
                      status,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
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
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ActivityPage()),
      // );
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
      break;
  }
}
