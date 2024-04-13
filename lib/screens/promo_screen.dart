import 'package:flutter/material.dart';
import 'package:kosku/components/asset_image_widget.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({Key? key}) : super(key: key);

  @override
  _PromoScreenState createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Center(
              child: Hero(
                tag: 'logo_image_hero', // Tag harus unik untuk setiap Hero widget
                child: AssetImageWidget(
                  imagePath: "assets/images/logo_kos.png",
                  width: 250,
                  height: 200,
                ),
              ),
            ),
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
                                    'Cari Promo',
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
            AssetImageWidget(
              imagePath: "assets/images/promo1.png",
              width: 350,
              height: 200,
            ),
               AssetImageWidget(
              imagePath: "assets/images/promo2.png",
              width: 350,
              height: 200,
            ),
               AssetImageWidget(
              imagePath: "assets/images/promo3.png",
              width: 350,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
