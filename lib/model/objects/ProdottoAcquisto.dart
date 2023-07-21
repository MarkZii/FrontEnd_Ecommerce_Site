import 'Prodotto.dart';

class ProdottoAcquisto{
  int id;
  int quantita;
  Prodotto prodotto;

  ProdottoAcquisto({required this.id, required this.quantita, required this.prodotto});

  factory ProdottoAcquisto.fromJson(Map<String, dynamic> json) {
    return ProdottoAcquisto(
      id: json ['id'],
      quantita: json ['quantita'],
      prodotto: Prodotto.fromJson(json['prodotto']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id':id,
    'quantita':quantita,
    'prodotto': prodotto
  };

  @override
  String toString() {
    return "Prodotto acqiustato di prezzo "+id.toString();
  }
}
