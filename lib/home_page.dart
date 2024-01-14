import 'package:dermarasa/activity_page.dart';
import 'package:dermarasa/kbsi_semarang.dart';
import 'package:dermarasa/masjid_barokah.dart';
import 'package:dermarasa/message_page.dart';
import 'package:dermarasa/panti_asuhan.dart';
import 'package:dermarasa/penggalangan_dana.dart';
import 'package:dermarasa/pondok_pesantren.dart';
import 'package:dermarasa/user_page.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controller for the first slider
  late PageController _firstSliderController;
  // Controller for the second slider
  late PageController _secondSliderController;

  // Current index for the first slider
  int _currentFirstSliderIndex = 0;
  // Current index for the second slider
  int _currentSecondSliderIndex = 0;

  // Define images for the first slider
  List<String> _firstSliderImages = [
    'assets/slider1.jpg',
    'assets/slider2.png',
    'assets/slider3.jpg',
    'assets/slider4.jpeg',
    'assets/slider5.jpg',
    'assets/slider6.jpg',
    'assets/slider7.jpg',
    'assets/slider8.jpeg',
    'assets/slider9.jpg',
  ];

  // Define images for the second slider
  List<String> _secondSliderImages = [
    'assets/slider10.jpg',
    'assets/slider11.jpg',
    'assets/slider12.jpg',
    'assets/slider13.jpg',
  ];

  @override
  void initState() {
    super.initState();
    // Initialize controllers with initialPage 0 and viewportFraction 0.8
    _firstSliderController =
        PageController(initialPage: 0, viewportFraction: 1.0);
    _secondSliderController =
        PageController(initialPage: 0, viewportFraction: 1.0);
  }

  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed
    _firstSliderController.dispose();
    _secondSliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set warna latar belakang menjadi putih
        automaticallyImplyLeading: false, // Nonaktifkan ikon kembali otomatis

        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(14.0),
              child: ClipOval(
                child: Image.asset(
                  'assets/logo_dermarasa.png',
                  width: 35,
                  height: 35,
                ),
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, bottom: 25, right: 10),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: 'Find More...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    prefixIcon: Icon(
                      FeatherIcons.search,
                      size: 22.0,
                      color: Color.fromARGB(255, 230, 127, 96),
                    ),
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // First Slider
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 20, top: 2, bottom: 10, left: 20),
              child: PageView.builder(
                controller: _firstSliderController,
                itemCount: _firstSliderImages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentFirstSliderIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildSlider(_firstSliderImages[index], false, '',
                      index); // Add an empty string as the third argument or provide a meaningful title if needed
                },
              ),
            ),
          ),
          SizedBox(height: 0),

          // Saldo Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Icon Uang
                  Column(
                    children: [
                      Icon(
                        Icons.currency_exchange,
                        size: 25,
                        color: Color.fromARGB(255, 230, 127, 96),
                      ),
                      Text(
                        'Rp 1.675.800',
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                    ],
                  ),
                  // Jumlah Saldo
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Action when button is pressed
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Tautkan Akun dengan Virtual Bank Account",
                                  style: GoogleFonts.poppins(fontSize: 12),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("OK",
                                        style:
                                            GoogleFonts.poppins(fontSize: 12)),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          'Isi Saldo',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 14),
          // Spacer 1 cm
          // Charity Section
          Column(
            children: [
              // Charity Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCharityItem(FeatherIcons.heart, 'Buat\nDonasi'),
                  _buildCharityItem(FeatherIcons.bookOpen, 'Donasi\nSaya'),
                  _buildCharityItem(
                    FeatherIcons.calendar,
                    'Donasi\nOtomatis',
                  ),
                  _buildCharityItem(FeatherIcons.box, 'Galang\nDana'),
                ],
              ),
              SizedBox(height: 5), // Spacer 5 pixels
              // Text "Penggalangan Dana"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Penggalangan Dana',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 230, 127, 96),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Color.fromARGB(255, 230, 127, 96),
                    onPressed: () {
                      // Navigasi ke halaman penggalangan_dana.dart
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PenggalanganDanaPage()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 0)
            ],
          ),
          SizedBox(
            height: 0,
          ),
          // Second Slider
          Flexible(
            child: Container(
              height: 200,
              margin: EdgeInsets.symmetric(
                  horizontal: 10), // Add margin for spacing
              child: PageView.builder(
                controller: _secondSliderController,
                itemCount: _secondSliderImages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentSecondSliderIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  String title = '';
                  switch (index) {
                    case 0:
                      title = 'Pembangunan Masjid Barokah';
                      break;
                    case 1:
                      title = 'Panti Asuhan An-nur';
                      break;
                    case 2:
                      title = 'Pondok Pesantren Darul Ilmi';
                      break;
                    case 3:
                      title = 'KBSI Semarang';
                      break;
                  }
                  return GestureDetector(
                      onPanUpdate: (details) {
                        // Handle swipe gestures for sliding
                        double sensitivity =
                            8.0; // Adjust sensitivity as needed
                        if (details.primaryDelta != null) {
                          if (details.primaryDelta! > sensitivity) {
                            _secondSliderController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          } else if (details.primaryDelta! < -sensitivity) {
                            _secondSliderController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          }
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                        ), // Adjust margin

                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Transform.translate(
                              offset: Offset(
                                0.0, // Adjust horizontal translation
                                0.0, // Adjust vertical translation
                              ),
                              child: Transform.scale(
                                scale:
                                    0.99, // Set scale factor for 3x smaller size
                                child: _buildSlider(_secondSliderImages[index],
                                    true, title, index),
                              ),
                            )),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor:
            Color.fromARGB(255, 230, 127, 96), // Set selected item color
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.home,
              color: Color.fromARGB(255, 230, 127, 96), // Ubah warna ikon
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.activity),
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
          _onBottomNavigationBarTap(index);
        },
      ),
    );
  }

  // Function to build charity item
  Widget _buildCharityItem(IconData icon, String text) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Icon(
            icon,
            size: 28,
            color: Color.fromARGB(255, 230, 127, 96),
          ),
        ),
        SizedBox(height: 4), // Sesuaikan jarak antara icon dan teks
        Text(
          text,
          style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center, // Posisi teks di tengah
        ),
      ],
    );
  }

  // Function to build the slider element
  // Modify the _buildSlider function to include an additional parameter for the index
  Widget _buildSlider(
      String imagePath, bool useColumn, String title, int index) {
    return GestureDetector(
        onTap: () {
          // Pass context and index to the function
          _navigateToPage(context, index);
        },
        child: Container(
          margin: EdgeInsets.only(top: 2, right: 2.0, left: 2.0),
          child: useColumn
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        height: 130,
                        width: 250,
                      ),
                    ),
                    SizedBox(height: 8), // Spacer 10 pixels
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/dermarasa_logo.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Conforma Berbagi',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 15),
                        Icon(
                          Icons.verified,
                          color: Color.fromARGB(
                              255, 230, 127, 96), // Adjust color as needed
                          size: 12,
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
        ));
  }

  // Function to handle bottom navigation bar taps
  void _onBottomNavigationBarTap(int index) {
    switch (index) {
      case 0:
        // Home Page
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
    }
  }
}

// Update the function signature to include the index parameter
void _navigateToPage(BuildContext context, int index) {
  switch (index) {
    case 0:
      // Navigate to Masjid Barokah page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MasjidBarokahPagePage()),
      );
      break;
    case 1:
      // Navigate to Panti Asuhan page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PantiAsuhanPage()),
      );
      break;
    case 2:
      // Navigate to Pondok Pesantren page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PondokPesantrenPage()),
      );
      break;
    case 3:
      // Navigate to KBSI Semarang page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => KBSISemarangPage()),
      );
      break;
  }
}
