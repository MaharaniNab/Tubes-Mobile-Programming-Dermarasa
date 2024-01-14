import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dermarasa/activity_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonasiPage extends StatefulWidget {
  @override
  _DonasiPageState createState() => _DonasiPageState();
}

class _DonasiPageState extends State<DonasiPage> {
  TextEditingController _nominalController = TextEditingController();

  void saveDonationToFirestore() async {
    String nominal = _nominalController.text;
    // String doa = // Get the value from the TextFormField;

    await FirebaseFirestore.instance.collection('dana').add({
      'nominal': nominal,
      // 'doa': doa,
      'timestamp': FieldValue.serverTimestamp(),
    });

    // Optionally, navigate to the ActivityPage after saving
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ActivityPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 127, 96),
        title: Text(
          'Masukkan Nominal',
          style: GoogleFonts.poppins(fontSize: 20.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 25.0, left: 25.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Nominal',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            TextField(
              controller: _nominalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefix: Text('Rp '),
                hintText: '0',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sertakan doa dan dukungan',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tulis doa dan dukungan Anda',
              ),
              style: GoogleFonts.poppins(fontSize: 12),
            ),
            SizedBox(height: 20),
            Text(
              'Pilih Metode Pembayaran',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PaymentMethodButton(imagePath: 'assets/bca_logo.png'),
                PaymentMethodButton(imagePath: 'assets/brimo_logo.png'),
                PaymentMethodButton(imagePath: 'assets/dana_logo.jpeg'),
                PaymentMethodButton(imagePath: 'assets/linkaja_logo.png'),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ElevatedButton(
                onPressed: () {
                  saveDonationToFirestore();
                },
                child: Text('Donasi Sekarang'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodButton extends StatelessWidget {
  final String imagePath;

  const PaymentMethodButton({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Tambahkan logika untuk menangani pemilihan metode pembayaran
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
