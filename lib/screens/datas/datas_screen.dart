import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kosku/dto/datas.dart';
import 'package:kosku/endpoints/datas_endpoint.dart';
import 'package:kosku/screens/datas/edit_datas.dart';
import 'package:kosku/screens/datas/new_datas.dart';
import 'package:kosku/services/datas_service.dart';

class DatasScreen extends StatefulWidget {
  const DatasScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DatasScreenState createState() => _DatasScreenState();
}

class _DatasScreenState extends State<DatasScreen> {
  Future<List<Datas>>? _datas;

  @override
  void initState() {
    super.initState();
    _datas = DataService.fetchDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Datas'),
      ),
      body: FutureBuilder<List<Datas>>(
        future: _datas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: item.imageUrl != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              width: 100,
                              Uri.parse(
                                      '${Endpoints.baseURL}/public/${item.imageUrl!}')
                                  .toString(),
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons
                                      .error), // Display error icon if image fails to load
                            ),
                          ],
                        )
                      : null,
                  subtitle: Column(children: [
                    Text('Name : ${item.name}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 36, 31, 31),
                          fontWeight: FontWeight.normal,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditDatas(item.idDatas),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            // Call deleteDatas method and pass the ID of the current item
                            DataService.deleteDatas(item.idDatas).then((_) {
                              // Show snackbar when deletion is successful
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Data successfully deleted'),
                                ),
                              );
                            }).catchError((error) {
                              // Handle error if deletion fails
                              print('Error deleting data: $error');
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                    const Divider(),
                  ]),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 54, 40, 176),
        tooltip: 'Increment',
        onPressed: () {
          // Navigator.pushNamed(context, '/form-screen');
          // BottomUpRoute(page: const FormScreen());
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewDatas()));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
