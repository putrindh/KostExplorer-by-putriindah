class Kos {
  // Attributes
  late int _id;
  late String _namaKos;
  late String _alamat;
  late String _tanggalPosting;
  late String _harga;
  late String _fasilitas;

  // Constructor
  Kos(this._id, this._namaKos, this._alamat, this._tanggalPosting, this._harga, this._fasilitas);

  // Named Constructor fromMap
  Kos.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._namaKos = map['nama_kos'].toString();
    this._alamat = map['alamat'].toString();
    this._tanggalPosting = map['tanggal_posting'].toString();
    this._harga = map['harga'].toString();
    this._fasilitas = map['fasilitas'].toString();
  }

  // Getter methods
  int get id => _id;
  String get namaKos => _namaKos;
  String get alamat => _alamat;
  String get tanggalPosting => _tanggalPosting;
  String get harga => _harga;
  String get fasilitas => _fasilitas;

  // Setter methods
  set namaKos(String value) {
    _namaKos = value;
  }

  set alamat(String value) {
    _alamat = value;
  }

  set tanggalPosting(String value) {
    _tanggalPosting = value;
  }

  set harga(String value) {
    _harga = value;
  }

  set fasilitas(String value) {
    _fasilitas = value;
  }

  // Convert object attributes to Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama_kos'] = namaKos;
    map['alamat'] = alamat;
    map['tanggal_posting'] = tanggalPosting;
    map['harga'] = harga;
    map['fasilitas'] = fasilitas;
    return map;
  }
}
