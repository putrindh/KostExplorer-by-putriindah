import 'package:flutter/material.dart';
import 'package:kosku/add_kos/addkos_baru.dart';
import 'package:kosku/add_kos/edit_addkos.dart';
import 'package:kosku/add_kos/helper_kos.dart';
import 'package:kosku/add_kos/present_addkos.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class KosScreen extends StatefulWidget {
  const KosScreen({Key? key}) : super(key: key);

  @override
  _KosScreenState createState() => _KosScreenState();
}

class _KosScreenState extends State<KosScreen> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Kos> kosList = [];

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kos'), // Mengubah judul
        leading: Icon(Icons.house), // Mengubah ikon
      ),
      body: SingleChildScrollView(
        child: createListView(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Kos', // Mengubah tooltip
        onPressed: () async {
          var kos = await navigateToInputKos(context);
          if (kos != null) addKos(kos);
        },
      ),
    );
  }

  Future<Kos?> navigateToInputKos(BuildContext context) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return InputKos(Kos(0, '', '', '', '', '')); // Membuat objek Kos baru
      }),
    );
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1!;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            title: Text(
              kosList[index].namaKos, // Mengubah atribut
              style: textStyle,
            ),
            subtitle: Text(kosList[index].alamat), // Mengubah atribut
            trailing: Wrap(
              spacing: 12, // space between two icons
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    var kos = await navigateToEditKos(context, kosList[index]);
                    if (kos != null) editKos(kos);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deleteKos(kosList[index]);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<Kos?> navigateToEditKos(BuildContext context, Kos kos) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return EditKosPage(kos: kos);
      }),
    );
  }

  void addKos(Kos kos) async {
    int result = await dbHelper.insert(kos);
    if (result > 0) {
      updateListView();
    }
  }

  void editKos(Kos kos) async {
    int result = await dbHelper.update(kos);
    if (result > 0) {
      updateListView();
      print("Edit Kos RESULT: $result");
    }
  }

  void deleteKos(Kos kos) async {
    int result = await dbHelper.delete(kos.id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Kos>> kosListFuture = dbHelper.getKosList();
      kosListFuture.then((kosList) {
        setState(() {
          this.kosList = kosList;
          this.count = kosList.length;
        });
      });
    });
  }
}
