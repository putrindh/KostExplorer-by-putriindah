import 'package:flutter/material.dart';
import 'package:kosku/add_kos/present_addkos.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class InputKos extends StatefulWidget {
  final Kos kos;

  InputKos(this.kos);

  @override
  _InputKosState createState() => _InputKosState(this.kos);
}

class _InputKosState extends State<InputKos> {
  Kos kos;
  TextEditingController namaKosController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController tanggalPostingController = TextEditingController();
  TextEditingController hargaController = TextEditingController(); // Menambahkan controller
  TextEditingController fasilitasController = TextEditingController(); // Menambahkan controller
  final format = DateFormat('yyyy-MM-dd');

  _InputKosState(this.kos);

  @override
  Widget build(BuildContext context) {
    namaKosController.text = kos.namaKos;
    alamatController.text = kos.alamat;
    tanggalPostingController.text = kos.tanggalPosting;

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Kos"),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: namaKosController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nama Kos",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: alamatController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Alamat",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: hargaController, // Menambahkan controller
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Harga", // Menambahkan label
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: fasilitasController, // Menambahkan controller
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Fasilitas", // Menambahkan label
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  DateTimeField(
                    controller: tanggalPostingController,
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime(2020),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2045),
                      );
                    },
                    decoration: InputDecoration(
                      labelText: "Tanggal Posting",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColorLight,
                        backgroundColor: Theme.of(context).primaryColorDark,
                      ),
                      child: Text("Simpan", textScaleFactor: 1.5),
                      onPressed: () {
                        kos.namaKos = namaKosController.text;
                        kos.alamat = alamatController.text;
                        kos.harga = hargaController.text; // Menambahkan nilai atribut
                        kos.fasilitas = fasilitasController.text; // Menambahkan nilai atribut
                        kos.tanggalPosting = tanggalPostingController.text;
                        print("Ini Update ya");
                        Navigator.pop(context, kos);
                      },
                    ),
                  ),
                  Container(width: 5.0),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColorLight,
                        backgroundColor: Theme.of(context).primaryColorDark,
                      ),
                      child: Text("Batal", textScaleFactor: 1.5),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
