import 'ProdottoAcquisto.dart';
import 'Utente.dart';

class Acquisto {
  int id;
  //DateTime data;
  Utente utente;
  ProdottoAcquisto prodottoAcquisto;

  Acquisto({ required this.id/*, required this.data*/, required this.utente, required this.prodottoAcquisto});

  factory Acquisto.fromJson(Map<String, dynamic> json) {
    /*DateTime dt = DateTime(2000, 1, 1, 00, 01);
    if(json["data"] != null) {
      List<dynamic> data = json["data"];
      dt = DateTime(data[0], data[1], data[2]);
    }*/
    return Acquisto(
      id: json['id'],
      //data: dt,
      utente: Utente.fromJson(json['utente']),
        prodottoAcquisto: ProdottoAcquisto.fromJson(json['prodottoAcquisto'])
    );
  }

  get dataA => null;

  Map<String, dynamic> toJson() => {
    'id': id,
    //'data': dataA==null? null :dataA!.toIso8601String(),
    'utente': utente,
    'prodottoAcquisto': prodottoAcquisto.toJson()
  };

  @override
  String toString() {
    return id.toString();
  }
}