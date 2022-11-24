import 'dart:convert';

List<Aduan> storeFromJson(String str) =>
    List<Aduan>.from(json.decode(str).map((x) => Aduan.fromJson(x)));

String storeToJson(List<Aduan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Aduan {
  var id;
  var tiketaduan;
  var judul;
  var isi;
  var alamat;
  var username;
  var statusaduan;

  Aduan(
      {this.id,
      this.tiketaduan,
      this.judul,
      this.isi,
      this.alamat,
      this.username,
      this.statusaduan});

  // Convert a Toko into a Map. The keys must correspond to the names of the
  // columns in the database.

  factory Aduan.fromJson(Map<String, dynamic> json) => Aduan(
      id: json["id"],
      tiketaduan: json["tiketaduan"],
      judul: json["judul"],
      isi: json["isi"],
      alamat: json["alamat"],
      username: json["username"],
      statusaduan: json["statusaduan"]);
  Map<String, dynamic> toJson() => {
        "id": id,
        "tiketaduan": tiketaduan,
        "judul": judul,
        "isi": isi,
        "alamat": alamat,
        "username": username,
        "statusaduan": statusaduan
      };

  // Implement toString to make it easier to see information about
  // each toko when using the print statement.

}
