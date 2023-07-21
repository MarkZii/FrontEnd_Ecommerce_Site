class DettaglioOrdineClient{
  int idProd;
  int quantita;
  double prezzo;

  DettaglioOrdineClient({required this.idProd, required this.quantita, required this.prezzo});

  factory DettaglioOrdineClient.fromJson(Map<String, dynamic> json) {
    return DettaglioOrdineClient(
      idProd: json['idProdotto'],
      quantita: json ['quantita'],
      prezzo: json ['prezzo'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id prodotto':idProd,
    'quantita':quantita,
    'prezzo':prezzo,
  };
}