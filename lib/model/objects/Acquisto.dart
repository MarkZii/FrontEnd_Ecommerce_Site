import 'Utente.dart';

class Acquisto {
  int id;
  DateTime data;
  Utente utente;


  Acquisto({ required this.id, required this.data, required this.utente});

  factory Acquisto.fromJson(Map<String, dynamic> json) {
    DateTime dt = DateTime(2000, 1, 1, 00, 01);
    if(json["dataNascita"] != null) {
      List<dynamic> data = json["dataNascita"];
      dt = DateTime(data[0], data[1], data[2]);
    }
    return Acquisto(
      id: json['id'],
      data: dt,
      utente: json['utente'],
    );
  }

  get dataNascita => null;

  Map<String, dynamic> toJson() => {
    'id': id,
    'dataNascita': dataNascita==null? null :dataNascita!.toIso8601String(),
    'utente': utente
  };
}