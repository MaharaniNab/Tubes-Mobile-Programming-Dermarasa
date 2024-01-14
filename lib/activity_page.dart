import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('dana').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          var donations = snapshot.data?.docs;

          return ListView.builder(
            itemCount: donations?.length,
            itemBuilder: (context, index) {
              var donation = donations![index].data();
              return _buildTransactionItem(
                imagePath: 'assets/slider10.jpg',
                title: 'Pembangunan Masjid Barokah',
                timestamp: 'Just Now', // Customize timestamp as needed
                amount: 'Rp ${donation['nominal']}',
                status: 'Berhasil',
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 230, 127, 96),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.activity,
              color: Color.fromARGB(255, 230, 127, 96),
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
          _onBottomNavigationBarTap(context, index);
        },
      ),
    );
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

  void _onBottomNavigationBarTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessagePage(
              title: '',
            ),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
    }
  }
}
