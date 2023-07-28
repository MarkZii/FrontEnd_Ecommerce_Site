import 'dart:convert';

import 'ProdottoAcquisto.dart';
import 'Utente.dart';

class Acquisto {
  int id;
  DateTime data;
  Utente utente;
  List<ProdottoAcquisto> prodottoAcquisto;

  Acquisto({ required this.id, required this.data, required this.utente, required this.prodottoAcquisto});

  factory Acquisto.fromJson(Map<String, dynamic> json) {
    int timestamp = json["data"];
    print(timestamp);
    print(DateTime.fromMillisecondsSinceEpoch(timestamp),);

    var itemList = json['prodottoAcquisto'] as List;
    List<ProdottoAcquisto> prodotti = itemList.map((prodottoAcquisto) => ProdottoAcquisto.fromJson(prodottoAcquisto)).toList();

    return Acquisto(
      id: json['id'],
        data: DateTime.fromMillisecondsSinceEpoch(timestamp),
        //data: dt,
      utente: Utente.fromJson(json['utente']),
      //prodottoAcquisto: [ProdottoAcquisto.fromJson(json['prodottoAcquisto'])],
        prodottoAcquisto: prodotti
    );
  }

  get dataA => null;

  Map<String, dynamic> toJson() => {
    'id': id,
    'data': dataA==null? null :dataA!.toIso8601String(),
    'utente': utente,
    //'prodottoAcquisto': prodottoAcquisto.toJson()
  };

  @override
  String toString() {
    return id.toString()+data.toString();
  }
}