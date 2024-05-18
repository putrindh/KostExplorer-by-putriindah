import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kosku/customer_service/edit_screen.dart';
import 'package:kosku/customer_service/new_cust.dart';
import 'package:kosku/dto/cust_service.dart';
import 'package:kosku/endpoints/cust_endpoints.dart';
import 'package:kosku/services/cust_services.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  Future<List<CustomerService>>? newcs;

  @override
  void initState() {
    super.initState();
    newcs = DataService.fetchCustomerService();
  }

  double _priority = 0; // Default priority
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Service"),
        backgroundColor: Colors.pink,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 54, 40, 176),
        tooltip: 'Tambahkan Customer Service Baru',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormScreen()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder<List<CustomerService>>(
                  future: newcs,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: ListTile(
                                title: item.imageUrl != null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            Uri.parse(
                                                    '${Endpoints.baseURL}/public/${item.imageUrl!}')
                                                .toString(),
                                            width: 100,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ],
                                      )
                                    : null,
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Text(
                                      'Judul: ${item.titleIssues}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                            255, 36, 31, 31),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Text(
                                      'Deskripsi: ${item.descriptionIssues}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                            255, 36, 31, 31),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Rating: ${item.rating}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 36, 31, 31),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Icon(Icons.star, color: Colors.amber,)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween, // Align buttons to start and end
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditDatas(item),
                                              ),
                                            );
                                          },
                                          icon: const Icon(Icons.edit),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            DataService.deleteDatas(
                                                    item.idCustomerService)
                                                .then((_) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Data berhasil dihapus'),
                                                ),
                                              );
                                            }).catchError((error) {
                                              print(
                                                  'Error deleting data: $error');
                                            });
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('${snapshot.error}'));
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
