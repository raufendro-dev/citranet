import 'dart:convert';

List<Usersimpan> storeFromJson(String str) =>
    List<Usersimpan>.from(json.decode(str).map((x) => Usersimpan.fromJson(x)));

String storeToJson(List<Usersimpan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usersimpan {
  var id;
  var nama;
  var username;
  var password;
  var pelangganid;
  var gambar;
  var status;

  Usersimpan(
      {this.id,
      this.nama,
      this.username,
      this.password,
      this.pelangganid,
      this.gambar,
      this.status});

  // Convert a Toko into a Map. The keys must correspond to the names of the
  // columns in the database.

  factory Usersimpan.fromJson(Map<String, dynamic> json) => Usersimpan(
        id: json["id"],
        nama: json["nama"],
        username: json["username"],
        password: json["password"],
        pelangganid: json["pelangganid"],
        gambar: json["gambar"],
        status: json["status"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "username": username,
        "password": password,
        "pelangganid": pelangganid,
        "gambar": gambar,
        "status": status
      };

  // Implement toString to make it easier to see information about
  // each toko when using the print statement.

}
