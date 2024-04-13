import 'package:flutter/material.dart';
import 'package:kosku/components/asset_image_widget.dart';

class TentangKami extends StatefulWidget {
  const TentangKami({Key? key}) : super(key: key);

  @override
  _TentangKamiState createState() => _TentangKamiState();
}

class _TentangKamiState extends State<TentangKami> {
  bool isDropdownVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tentang Kami"),
        ),
        body: Column(
          children: [
            Center(
              child: Hero(
                tag:
                    'logo_image_hero', // Tag harus unik untuk setiap Hero widget
                child: AssetImageWidget(
                  imagePath: "assets/images/logo_kos.png",
                  width: 250,
                  height: 200,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Kost Explorer merupakan sebuah platform yang mewadahi para owner bisnis kost yang ada di singaraja untuk memasarkan kost melalui media digital. Kost Explorer ini juga akan membantu mahasiswa/orang baru khususnya daerah singaraja dalam menemukan kost secara praktis dan mudah",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isDropdownVisible = !isDropdownVisible;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.security),
                            SizedBox(width: 10),
                            Text(
                              'Kebijakan Privasi',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        if (isDropdownVisible) ...[
                          SizedBox(
                              height: 8), // Spacing between text and dropdown
                          Text(
                            '1. Pendaftaran kost oleh owner harus memiliki data yang akurat beserta surat keterangan sebagai bukti',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            '2. Setiap owner kost akan melakukan tanda tangan kontrak sebagai perjanjian terhadap sistem Kost Explorer',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            '3. Setiap owner kost akan dikenakan pajak 2% sebagai biaya penyewaan platform Kost Explorer',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            '4. Setiap owner kost akan menginput bukti transaksi agar dapat update kost pada platform Kost Explorer ',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            '5. Setiap owner kost akan dikenakan sanksi bila melanggar perjanjian/kontrak yang tertera',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          // Add more dropdown items here if needed
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
