import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:kosku/add_kos/present_addkos.dart';

class EditKosPage extends StatefulWidget {
  final Kos kos;

  EditKosPage({required this.kos});

  @override
  _EditKosPageState createState() => _EditKosPageState();
}

class _EditKosPageState extends State<EditKosPage> {
  final format = DateFormat("yyyy-MM-dd");
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _hargaController = TextEditingController(); // Menambahkan controller
  TextEditingController _fasilitasController = TextEditingController(); // Menambahkan controller
  DateTime? _tanggalPosting;

  @override
  void initState() {
    super.initState();
    _namaController.text = widget.kos.namaKos;
    _alamatController.text = widget.kos.alamat;
    _hargaController.text = widget.kos.harga; // Mengisi nilai controller
    _fasilitasController.text = widget.kos.fasilitas; // Mengisi nilai controller
    _tanggalPosting = DateTime.parse(widget.kos.tanggalPosting);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Kos'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama Kos'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _hargaController, // Menambahkan controller
                decoration: InputDecoration(labelText: 'Harga'), // Menambahkan label
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _fasilitasController, // Menambahkan controller
                decoration: InputDecoration(labelText: 'Fasilitas'), // Menambahkan label
              ),
              SizedBox(height: 10),
              DateTimeField(
                format: format,
                initialValue: _tanggalPosting,
                decoration: InputDecoration(
                  labelText: "Tanggal Posting",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2045),
                  );
                },
                onChanged: (selectedDate) {
                  setState(() {
                    _tanggalPosting = selectedDate;
                  });
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    _saveChanges();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(double.infinity, 50), // Lebar minimum tombol
                  ),
                  child: Text('Simpan Perubahan', style: TextStyle(fontSize: 16)),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(double.infinity, 50), // Lebar minimum tombol
                  ),
                  child: Text('Batal', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveChanges() {
    // Mendapatkan nilai terbaru dari TextFormField
    String namaKos = _namaController.text;
    String alamat = _alamatController.text;
    String harga = _hargaController.text; // Mengambil nilai dari controller
    String fasilitas = _fasilitasController.text; // Mengambil nilai dari controller
    String tanggalPosting = _tanggalPosting != null
        ? format.format(_tanggalPosting!)
        : widget.kos.tanggalPosting;

    // Membuat objek Kos baru dengan nilai terbaru
    Kos updatedKos = Kos(
      widget.kos.id,
      namaKos,
      alamat,
      tanggalPosting,
      harga, // Menambahkan nilai atribut
      fasilitas, // Menambahkan nilai atribut
    );

    // Mengembalikan nilai Kos yang diperbarui ke halaman sebelumnya
    Navigator.pop(context, updatedKos);
  }
}
