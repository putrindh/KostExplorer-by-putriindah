import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kosku/endpoints/cust_endpoints.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _titleController = TextEditingController();
  final _ratingController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _selectedDivision = 'Dailing'; // Default division
  double _priority = 0; // Default priority

  String _title = "";
  String _description = "";
  int _rating = 0;
  File? galleryFile;
  final picker = ImagePicker();

//Menampilkan modal buttom sheet untuk memilih gambar
  _showPicker({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Library'),
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
        );
      },
    );
  }

//Method memilih gambar dari galeri atau kamera
  Future getImage(ImageSource img) async {
    final pickedFile = await picker.pickImage(source: img);
    setState(() {
      if (pickedFile != null) {
        galleryFile = File(pickedFile.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nothing is selected')),
        );
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  saveData() {
    debugPrint(_title);
  }

  Future<void> _postDataWithImage(BuildContext context) async {
    if (galleryFile == null) {
      return;
    }

    var request = MultipartRequest('POST', Uri.parse(Endpoints.newcs));
    request.fields['title_issues'] = _titleController.text;
    request.fields['description_issues'] = _descriptionController.text;
    request.fields['rating'] = _ratingController.text;

    var multipartFile = await MultipartFile.fromPath(
      'image',
      galleryFile!.path,
    );
    request.files.add(multipartFile);

    request.send().then((response) {
      if (response.statusCode == 201) {
        debugPrint('Data and image posted successfully!');
        Navigator.of(context).pop();
      } else {
        debugPrint('Error posting data: ${response.statusCode}');
      }
    });
  }

//method membuat tampilan widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 150, 12, 12),
      appBar: AppBar(
        title: Text(
          'Create New Customer',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Color.fromARGB(0, 150, 118, 118),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Division',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedDivision,
                decoration: InputDecoration(
                  hintText: 'Select Division',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDivision = newValue!;
                  });
                },
                items: <String>['Dailing', 'Teknis', 'Support']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              Text(
                'Title',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextField(
                controller: _titleController,
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter title',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Description',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextField(
                controller: _descriptionController,
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter description',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Upload Image',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  _showPicker(context: context);
                },
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: galleryFile == null
                      ? Center(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 40,
                            color: Color.fromARGB(255, 243, 33, 198),
                          ),
                        )
                      : Image.file(galleryFile!),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Rating',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextField(
                controller: _ratingController,
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter title',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Slider(
                value: _priority,
                onChanged: (newValue) {
                  setState(() {
                    _priority = newValue;
                  });
                },
                min: 0,
                max: 10,
                divisions: 10,
                label: _priority.toString(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Increment',
        onPressed: () {
          _postDataWithImage(context);
        },
        child: const Icon(Icons.save, color: Colors.white, size: 28),
      ),
    );
  }
}
