import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kosku/endpoints/datas_endpoint.dart';

class EditDatas extends StatefulWidget {
  final int idDatas; // Define idDatas property

  const EditDatas(this.idDatas, {Key? key}) : super(key: key);

  @override
  _EditDatasState createState() => _EditDatasState();
}

class _EditDatasState extends State<EditDatas> {
  final _titleController = TextEditingController();
  String _title = "";

  File? galleryFile;
  final picker = ImagePicker();

  _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      getImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      getImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Nothing is selected')),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _titleController.dispose(); // Dispose of controller when widget is removed
    super.dispose();
  }

  Future<void> _editDatas(BuildContext context, int id) async {
    // Added ID parameter
    if (_title.isEmpty || galleryFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please provide a title and select an image')),
      );
      return; // Stop execution if title or image is missing
    }

    var request = MultipartRequest(
        'PUT', Uri.parse('${Endpoints.datas}/$id')); // Using provided ID
    request.fields['name'] =
        _titleController.text; // Update name field with new title

    var multipartFile = await MultipartFile.fromPath(
      'image',
      galleryFile!.path,
    );
    request.files.add(multipartFile);

    request.send().then((response) {
      // Handle response (success or error)
      if (response.statusCode == 200) {
        debugPrint('Data and image edited successfully!');
        Navigator.pushReplacementNamed(context, '/datas-screen');
      } else {
        debugPrint('Error editing data: ${response.statusCode}');
      }
    }).catchError((error) {
      debugPrint('Error editing data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        title: null,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white), // recolor the icon
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edit datas", // Changed title to "Edit datas"
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Edit the datas below, make sure you update titles and images", // Updated description
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showPicker(context: context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                ),
                                width: double.infinity,
                                height: 150,
                                child: galleryFile == null
                                    ? Center(
                                        child: Text(
                                          'Pick your Image here',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: const Color.fromARGB(
                                                255, 124, 122, 122),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: Image.file(galleryFile!),
                                      ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: _titleController,
                                decoration: const InputDecoration(
                                  hintText: "Title of Image",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _title = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Save', // Changed tooltip to "Save"
        onPressed: () {
          _editDatas(context,
              widget.idDatas); // Call _editDatas method with ID parameter
        },
        child: const Icon(Icons.save, color: Colors.white, size: 28),
      ),
    );
  }
}
