import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IsiSaldoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 127, 96),
        title: Text(
          'Isi Saldo',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Color.fromARGB(255, 230, 127, 96),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saldo Dermawan',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Rp.1.675.800',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Pilih Nominal',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 230, 127, 96),
                    ),
                  ),
                  SizedBox(height: 16),
                  buildNominalButton(context, 'Rp. 20.000'),
                  SizedBox(height: 8),
                  buildNominalButton(context, 'Rp. 50.000'),
                  SizedBox(height: 8),
                  buildNominalButton(context, 'Rp. 100.000'),
                  SizedBox(height: 8),
                  buildNominalButton(context, 'Rp. 500.000'),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika untuk melakukan pengisian saldo
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 230, 127, 96),
                      onPrimary: Colors.white,
                    ),
                    child: Text(
                      'Pilih Nominal Lainnya',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNominalButton(BuildContext context, String nominal) {
    return ElevatedButton(
      onPressed: () {
        // Tambahkan logika untuk menangani pemilihan nominal
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Color.fromARGB(255, 243, 177, 157),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        width: double.infinity,
        child: Center(
            child: Text(
          nominal,
          style: GoogleFonts.poppins(color: Colors.white),
        )),
      ),
    );
  }
}
