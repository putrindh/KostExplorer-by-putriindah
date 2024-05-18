import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kosku/dto/cust_service.dart';
import 'package:kosku/endpoints/cust_endpoints.dart';
import 'package:http/http.dart' as http;

class EditDatas extends StatefulWidget {
  final CustomerService customerService;
  const EditDatas(this.customerService, {Key? key}) : super(key: key);

  @override
  _EditDatasState createState() => _EditDatasState();
}

class _EditDatasState extends State<EditDatas> {
  final _titleController = TextEditingController();
  final _ratingController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _selectedDivision = 'Dailing';
  double _priority = 0;
  File? galleryFile;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.customerService.titleIssues;
    _ratingController.text = widget.customerService.rating.toString();
    _descriptionController.text = widget.customerService.descriptionIssues;

    if (widget.customerService.imageUrl != null) {
      setState(() {
        galleryFile = null;
      });
    } else {
      setState(() {
        galleryFile = null;
      });
    }
  }

  _showPicker({required BuildContext context}) {
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

  Future getImage(ImageSource img) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(() {
      if (xfilePick != null) {
        galleryFile = File(pickedFile!.path);
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
    _ratingController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  saveData() {
    // Your existing code
  }

  Future<void> _editDataWithImage(BuildContext context) async {
    // Mengambil nilai dari controller
    String title = _titleController.text;
    String description = _descriptionController.text;
    int rating = int.tryParse(_ratingController.text) ?? 0;

    // Membuat objek MultipartRequest
    var request = http.MultipartRequest('POST', Uri.parse(Endpoints.newcs));

    // Menambahkan data ke dalam request
    request.fields['title_issues'] = title;
    request.fields['description_issues'] = description;
    request.fields['rating'] = rating.toString();
    request.fields['priority'] = _priority.toString(); // Menambahkan nilai priority

    // Menambahkan file gambar ke dalam request
    if (galleryFile != null) {
      var multipartFile = await http.MultipartFile.fromPath(
        'image',
        galleryFile!.path,
      );
      request.files.add(multipartFile);
    }

    // Mengirim request
    var response = await request.send();

    // Memeriksa status kode respons
    if (response.statusCode == 201) {
      debugPrint('Data and image posted successfully!');
      Navigator.of(context).pop();
    } else {
      debugPrint('Error posting data: ${response.statusCode}');
      // Tambahkan logika penanganan kesalahan sesuai kebutuhan aplikasi Anda
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 33, 198),
      appBar: AppBar(
        title: Text(
          'Create Customer Issue',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Division',
                style: TextStyle(
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
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextField(
                controller: _titleController,
                onChanged: (value) {
                  setState(() {
                    // Update _title value
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
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextField(
                controller: _descriptionController,
                onChanged: (value) {
                  setState(() {
                    // Update _description value
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
                style: TextStyle(
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
                      ? widget.customerService.imageUrl != null
                          ? Image.network(
                              Uri.parse(
                                '${Endpoints.baseURL}/public/${widget.customerService.imageUrl!}',
                              ).toString(),
                              width: 100,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                            )
                          : Center(
                              child: Icon(
                                Icons.add_a_photo,
                                size: 40,
                                color: Color.fromARGB(255, 243, 33, 198),
                              ),
                            )
                      : Image.file(galleryFile!), // Display selected image
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Rating',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextField(
                controller: _ratingController,
                onChanged: (value) {
                  setState(() {
                    // Update _rating value
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter rating',
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
        tooltip: 'Save',
        onPressed: () {
          _editDataWithImage(context);
        },
        child: const Icon(Icons.save, color: Colors.white, size: 28),
      ),
    );
  }
}
