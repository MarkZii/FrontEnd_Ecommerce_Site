import 'Prodotto.dart';

class ProdottoAcquisto{
  int id;
  int quantita;
  double prezzo;
  Prodotto prodotto;

  ProdottoAcquisto({required this.id, required this.quantita, required this.prezzo, required this.prodotto});

  factory ProdottoAcquisto.fromJson(Map<String, dynamic> json) {
    return ProdottoAcquisto(
      id: json ['id'],
      quantita: json ['quantita'],
      prezzo: json['prezzo'],
      prodotto: Prodotto.fromJson(json['prodotto']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id':id,
    'quantita':quantita,
    'prezzo':prezzo,
    'prodotto': prodotto.toJson()
  };

  @override
  String toString() {
    return "Prodotto acqiustato di prezzo "+id.toString();
  }
}
