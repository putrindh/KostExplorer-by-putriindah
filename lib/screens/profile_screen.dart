import 'package:flutter/material.dart';
import 'package:kosku/components/asset_image_widget.dart';
import 'package:kosku/screens/person_screen.dart';
import 'package:kosku/screens/tentang_kami.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFF7D4), // Ubah latar belakang menjadi warna FFF7D4
      child: Column(
        children: [
          AssetImageWidget(imagePath: 'assets/images/logo_kos.png'),
          Divider(
            color: Colors.grey, // Customize divider color
            thickness: 1, // Customize divider thickness
            indent: 10, // Customize left indentation of the divider
            endIndent: 10, // Customize right indentation of the divider
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PersonScreen()),
                    );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 10),
                            Text(
                              'Personal',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity, // Set the width to match parent
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.power_settings_new), // Add your icon here
                          SizedBox(
                              width: 10), // Add space between icon and text
                          Text(
                            'Logout', // Provide initial value if needed
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity, // Set the width to match parent
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.person_search), // Add your icon here
                          SizedBox(
                              width: 10), // Add space between icon and text
                          Text(
                            'Hubungi Kami', // Provide initial value if needed
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TentangKami()),
                    );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.spatial_audio),
                            SizedBox(width: 10),
                            Text(
                              'Tentang Kami',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen2 extends StatelessWidget {
  const ProfileScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('test'));
  }
}
