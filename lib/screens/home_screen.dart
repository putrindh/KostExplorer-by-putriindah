import 'package:flutter/material.dart';
import 'package:kosku/components/asset_image_widget.dart';
import 'package:kosku/screens/promo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Color(0xFFFFF7D4),
                child: Column(
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Search',
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Action when the card is tapped
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 0,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Cari',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Cek Promo"),
                        Hero(
                          tag:
                              'arrow_icon', // Tag harus sama dengan yang digunakan sebelumnya
                          child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                              icon: Icon(Icons.arrow_circle_right_outlined),
                              onPressed: () {
                                // Navigasi ke halaman lain
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PromoScreen()),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.trending_up),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Trending !",
                          style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 25,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildImageContainer(
                            'assets/images/kos1.jpg',
                            'Kost Gumitish',
                            'Jl. Banyuning Lestari No.4',
                          ),
                          const SizedBox(width: 20),
                          _buildImageContainer('assets/images/kos2.jpg',
                              'Kost Adityapurana', 'Jl. Wijaya Kusuma No.1'),
                          const SizedBox(width: 20),
                          _buildImageContainer(
                            'assets/images/kos3.jpg',
                            'Kost Sekar Panji',
                            'Jl. Anggrek 1 No. 2',
                          ),
                        ],
                      ),
                    ), // Add spacing between carousel and text
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                        height: 20), // Add spacing between carousel and text
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 16.0), // Align text to the left
                      child: Text(
                        'Cari Kos Sesuai Budgetmu :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Adding space before the cards
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text('+- Rp. 500k'),
                                // Add content for Card 1 here
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text('+- Rp. 600k'),
                                // Add content for Card 2 here
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text('+-Rp.800k'),
                                // Add content for Card 3 here
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 170,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              AssetImageWidget(
                                imagePath: 'assets/images/kost8.jpg',
                                width: 130,
                                height: 140,
                              ),
                              Text("Kos Cempaka"),
                              Text("Rp. 650.000")
                            ],
                          ),
                        ),
                        Container(
                          width: 170,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              AssetImageWidget(
                                imagePath: 'assets/images/kos5.jpg',
                                width: 130,
                                height: 140,
                                fit: BoxFit.contain,
                              ),
                              Text("Kos Melati"),
                              Text("Rp. 555.000")
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 170,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              AssetImageWidget(
                                imagePath: 'assets/images/kost6.jpg',
                                width: 130,
                                height: 140,
                              ),
                              Text("Kos Brawijaya"),
                              Text("Rp. 675.000")
                            ],
                          ),
                        ),
                        Container(
                          width: 170,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              AssetImageWidget(
                                imagePath: 'assets/images/kost7.jpeg',
                                width: 130,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                              Text("Kos Anggrek"),
                              Text("Rp. 850.000")
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 170,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              AssetImageWidget(
                                imagePath: 'assets/images/kost10.jpeg',
                                width: 140,
                                height: 140,
                              ),
                              Text("Kos Dewi Sita"),
                              Text("Rp. 650.000")
                            ],
                          ),
                        ),
                        Container(
                          width: 170,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              AssetImageWidget(
                                imagePath: 'assets/images/kos puri rahayu.jpeg',
                                width: 160,
                                height: 140,
                                fit: BoxFit.contain,
                              ),
                              Text("Kos Puri Rahayu"),
                              Text("Rp. 750.000")
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 170,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              AssetImageWidget(
                                imagePath: 'assets/images/kos flamboyan.jpeg',
                                width: 160,
                                height: 140,
                              ),
                              Text("Kos Flamboyan"),
                              Text("Rp. 695.000")
                            ],
                          ),
                        ),
                        Container(
                          width: 170,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              AssetImageWidget(
                                imagePath: 'assets/images/kos kamboja.jpeg',
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                              Text("Kos Kamboja"),
                              Text("Rp. 850.000")
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer(
      String imagePath, String textAbove, String textBelow) {
    return Container(
      width: 200, // Sesuaikan dengan lebar gambar
      height: 300, // Sesuaikan dengan tinggi gambar, teks atas, dan teks bawah
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent
                .withOpacity(0.5), // Warna bayangan dengan opacity
            spreadRadius: 2, // Jarak penyebaran bayangan
            blurRadius: 10, // Besarnya blur bayangan
            offset: Offset(0, 0), // Posisi bayangan
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent
                    .withOpacity(0.3), // Warna latar belakang pink yang menyala
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10)),
                    color: Colors.black
                        .withOpacity(0.7), // Warna latar belakang teks
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        textAbove,
                        style: TextStyle(
                          color: Colors.white, // Warna teks atas
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4),
                      Text(
                        textBelow,
                        style: TextStyle(
                          color: Colors.white, // Warna teks bawah
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
