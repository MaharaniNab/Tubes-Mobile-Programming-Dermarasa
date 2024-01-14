import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'masjid_barokah.dart'; // Import halaman Masjid Barokah
import 'panti_asuhan.dart'; // Import halaman Panti Asuhan An-nur
import 'pondok_pesantren.dart'; // Import halaman Pondok Pesantren Darul Ilmi
import 'kbsi_semarang.dart'; // Import halaman KBSI Semarang

class PenggalanganDanaPage extends StatefulWidget {
  @override
  _PenggalanganDanaPageState createState() => _PenggalanganDanaPageState();
}

class _PenggalanganDanaPageState extends State<PenggalanganDanaPage> {
  final List<String> _secondSliderImages = [
    'assets/slider10.jpg',
    'assets/slider11.jpg',
    'assets/slider12.jpg',
    'assets/slider13.jpg',
  ];

  int _currentSecondSliderIndex = 0;
  late PageController _secondSliderController;

  @override
  void initState() {
    super.initState();
    _secondSliderController =
        PageController(initialPage: _currentSecondSliderIndex);
  }

  @override
  void dispose() {
    _secondSliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 127, 96),
        title: Text(
          'Penggalangan Dana',
          style: GoogleFonts.poppins(fontSize: 20.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: PageView.builder(
                controller: _secondSliderController,
                itemCount: _secondSliderImages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentSecondSliderIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildSlider(_secondSliderImages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(String imagePath) {
    return GestureDetector(
      onTap: () {
        _navigateToPage(_currentSecondSliderIndex);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child:
              Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
        ),
      ),
    );
  }

  Widget _buildSection() {
    String title = _getSliderTitle(_currentSecondSliderIndex);
    String amount = _getSliderAmount(_currentSecondSliderIndex);
    String daysLeft = _getSliderDaysLeft(_currentSecondSliderIndex);
    String progress = _getSliderProgress(_currentSecondSliderIndex);

    return Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 230, 127, 96),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          // Outer container for margin
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    amount,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Color.fromARGB(255, 230, 127, 96),
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    daysLeft,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: double.parse(progress) / 100,
                      color: Color.fromARGB(255, 230, 127, 96),
                    ),
                  ),
                  Text(
                    progress + '%',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  String _getSliderTitle(int index) {
    switch (index) {
      case 0:
        return 'Pembangunan Masjid Barokah';
      case 1:
        return 'Panti Asuhan An-nur';
      case 2:
        return 'Pondok Pesantren Darul Ilmi';
      case 3:
        return 'KBSI Semarang';
      default:
        return '';
    }
  }

  String _getSliderAmount(int index) {
    switch (index) {
      case 0:
        return 'Rp40.113.700,-';
      case 1:
        return 'Rp4.243.675,-';
      case 2:
        return 'Rp10.278.900,-';
      case 3:
        return 'Rp37.243.500,-';
      default:
        return '';
    }
  }

  String _getSliderDaysLeft(int index) {
    switch (index) {
      case 0:
        return '13\nHari Lagi';
      case 1:
        return '14\nHari Lagi';
      case 2:
        return '5\nHari Lagi';
      case 3:
        return '3\nHari Lagi';
      default:
        return '';
    }
  }

  String _getSliderProgress(int index) {
    switch (index) {
      case 0:
        return '40';
      case 1:
        return '30';
      case 2:
        return '70';
      case 3:
        return '80';
      default:
        return '';
    }
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MasjidBarokahPagePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PantiAsuhanPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PondokPesantrenPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KBSISemarangPage()),
        );
        break;
      default:
        break;
    }
  }
}
